import 'package:dro/controller/Bloc/cubit/cart_cubit.dart';
import 'package:dro/controller/Bloc/cubit/database_cubit.dart';
import 'package:dro/core/messages.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:dro/ui/landing/view/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Initial Selected Value
  String dropdownvalue = '1';

  // List of items in our dropdown menu
  var items = ['1', '2', '3', '4', '5', '6', '7', '8'];
  CartCubit? _cartCubit;
  static List getME = [];
  static int getAmount = 0;
  num _amount = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TopAppBar(
                height: 120.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavBar(),
                                    ),
                                    (route) => false);
                              },
                              icon: SvgPicture.asset("assets/svgs/back.svg"),
                            ),
                            SvgPicture.asset("assets/svgs/chart.svg"),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              "Cart",
                              style: TextStyle(
                                fontFamily: "ProximaNovaFont",
                                fontWeight: FontWeight.bold,
                                color: kPrimaryIconColor,
                                fontSize: 22.0,
                                letterSpacing: 1.0,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              BlocConsumer<DatabaseCubit, DatabaseState>(
                listener: (context, state) {
                  if (state is DatabaseloadState) {
                    _cartCubit = CartCubit(
                      database: context.read<DatabaseCubit>().database!,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is DatabaseloadState) {
                    _cartCubit = CartCubit(
                      database: context.read<DatabaseCubit>().database!,
                    );
                    return BlocProvider<CartCubit>(
                      create: (context) => _cartCubit!..getCarts(),
                      child: BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {},
                        builder: (context, cartState) {
                          if (_cartCubit != null) {
                            final cart = _cartCubit!.carts;
                            if (cart.isEmpty) {
                              return const Text("Cart is Empty");
                            } else {
                              if (cartState is InitCartState) {
                                // calculate the amount of total product
                                for (int i = 0; i < cart.length; i++) {
                                  getME = [cart[i].amount];
                                  getME.forEach(
                                    (element) {
                                      _amount += int.parse(element.toString());
                                    },
                                  );
                                }
                                getAmount = _amount.toInt();

                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: cart.length,
                                    shrinkWrap: true,
                                    itemBuilder: (contex, index) {
                                      dropdownvalue =
                                          cart[index].items.toString();
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/${cart[index].image}.png",
                                                  fit: BoxFit.fill,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      cart[index].name,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "ProximaNovaFont",
                                                        fontSize: 16.0,
                                                        color: kBlackColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      "Tablet · ${cart[index].tablet}",
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "ProximaNovaFont",
                                                        fontSize: 14.0,
                                                        color: kSecondaryColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 9.0,
                                                    ),
                                                    Text(
                                                      "₦${cart[index].amount}.00",
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "ProximaNovaFont",
                                                        fontSize: 18.0,
                                                        color: kBlackColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: DropdownButton(
                                                      value: dropdownvalue,
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: items
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        dropdownvalue =
                                                            newValue!;
                                                        _cartCubit!.updateCarts(
                                                          cart[index].id,
                                                          int.parse(
                                                            newValue.toString(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                InkResponse(
                                                  onTap: () {
                                                    _cartCubit!.removeCart(
                                                        cart[index].id);
                                                    displayErrorMessage(
                                                      error:
                                                          "Item removed successfully",
                                                      context: _dialogKey,
                                                      scaffoldKey: _scaffoldKey,
                                                      popStack: false,
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/svgs/remove.svg"),
                                                      const SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      const Text(
                                                        "Remove",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "ProximaNovaFont",
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          color: kPrimaryColor,
                                                          fontSize: 12.0,
                                                          letterSpacing: 1.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else if (cartState is CartAdd) {
                                return const Text("2");
                              } else if (cartState is CartUpdate) {
                                return const Text("3");
                              } else {
                                return const Text("4");
                              }
                            }
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    );
                  } else {
                    return const Text("Loading");
                  }
                },
              ),
            ],
          ),
          Visibility(
            visible: getAmount == 0 ? false : true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Total: ",
                      style: const TextStyle(
                        fontFamily: "ProximaNovaFont",
                        fontWeight: FontWeight.w400,
                        color: kSecondaryColor,
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      ),
                      children: [
                        TextSpan(
                          text: "₦$getAmount.00",
                          style: const TextStyle(
                            fontFamily: "ProximaNovaFont",
                            fontWeight: FontWeight.w600,
                            color: kBlackColor,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkResponse(
                    onTap: () {
                      displaySuccessMessage(
                        text: "Checkout Successfully",
                        context: _dialogKey,
                        scaffoldKey: _scaffoldKey,
                        popStack: false,
                      );
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const CartScreen(),
                      //   ),
                      // );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: 50.0,
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(
                          end: Alignment(1.5, 0.0),
                          colors: <Color>[
                            Color(0XFF822AF6),
                            kPrimaryColor,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0XFFFE806F).withOpacity(0.4),
                            offset: const Offset(-5.0, 4.0),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(
                            fontFamily: "ProximaNovaFont",
                            fontWeight: FontWeight.w700,
                            color: kBackgroundColor,
                            fontSize: 17.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
