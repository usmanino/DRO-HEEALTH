import 'dart:developer';

import 'package:dro/controller/Bloc/cubit/cart_cubit.dart';
import 'package:dro/controller/Bloc/cubit/database_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/cart_dialog.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:dro/model/supplements_model.dart';
import 'package:dro/ui/pharmacy/subView/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  final searchText = TextEditingController();
  static var getList = [];
  CartCubit? _cartCubit;
  @override
  Widget build(BuildContext context) {
    final _checkKeyboardVisibilty = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  width: 3.0,
                  color: kBackgroundColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0XFFFE806F).withOpacity(0.4),
                    offset: const Offset(-5.0, 8.0),
                    blurRadius: 6,
                  ),
                ],
                gradient: const LinearGradient(
                  end: Alignment(1.5, 0.0),
                  colors: <Color>[
                    Color(0XFFFE806F),
                    Color(0XFFE5366A),
                  ],
                ),
              ),
              child: SvgPicture.asset(
                "assets/svgs/chart.svg",
                width: 27.0,
              ),
            ),
            const Positioned(
              right: 0.0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Color(0XFFF2C94C),
                child: Text(
                  "2",
                  style: TextStyle(
                    fontFamily: "ProximaNovaFont",
                    fontSize: 16.0,
                    color: kBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<SuplementCubit, SuplementState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SuplementSuccess) {
            return Column(
              children: [
                SizedBox(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 140.0,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                height: 90.0,
                                color: kSecondaryBorder,
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 40.0,
                                ),
                                margin: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svgs/location.svg"),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        text: "Delivery in ",
                                        style: TextStyle(
                                          fontFamily: "ProximaNovaFont",
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Lagos, NG",
                                            style: TextStyle(
                                              fontFamily: "ProximaNovaFont",
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TopAppBar(
                        height: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: SvgPicture.asset(
                                        "assets/svgs/back.svg",
                                      ),
                                    ),
                                    const Text(
                                      "Pharmacy",
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
                                SvgPicture.asset("assets/svgs/delivery.svg")
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: getList.isEmpty
                                      ? MediaQuery.of(context).size.width / 1.6
                                      : MediaQuery.of(context).size.width / 1.2,
                                  margin: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    controller: searchText,
                                    style: const TextStyle(
                                      fontFamily: "ProximaNovaFont",
                                      color: kPrimaryIconColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: const TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        color: kPrimaryIconColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search_rounded,
                                        color: kPrimaryIconColor,
                                        size: 30.0,
                                      ),
                                      prefixIconColor: kPrimaryIconColor,
                                      fillColor: kPrimaryColor.withOpacity(0.7),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.toString().trim().isEmpty) {
                                        return;
                                      }
                                      List<SupplementModle> me =
                                          state.suplementList;
                                      setState(() {
                                        getList = me.where(
                                          (element) {
                                            return element.name
                                                .toString()
                                                .toLowerCase()
                                                .contains(value
                                                    .toString()
                                                    .toLowerCase());
                                          },
                                        ).toList();
                                      });
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: getList.isEmpty ? true : false,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 10.0,
                                      top: 10.0,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        searchText.text = "";
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontFamily: "ProximaNovaFont",
                                          fontWeight: FontWeight.w600,
                                          color: kBackgroundColor,
                                          fontSize: 20.0,
                                          letterSpacing: 1.0,
                                          fontStyle: FontStyle.normal,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                if (getList.isEmpty) ...{
                  Visibility(
                    visible: _checkKeyboardVisibilty != 0 ? false : true,
                    child: SvgPicture.asset("assets/svgs/Error404.svg"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: _checkKeyboardVisibilty != 0
                        ? const EdgeInsets.only(top: 30.0)
                        : null,
                    child: Text(
                      "No result found for “${searchText.text}”",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "ProximaNovaFont",
                        fontWeight: FontWeight.w600,
                        color: kBlackColor.withOpacity(0.6),
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontStyle: FontStyle.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                } else ...{
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                mainAxisExtent: 260,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: getList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        20.0,
                                      ),
                                      color: kBackgroundColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: kSecondaryColor,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                  color: const Color(0XFFDEEBEE)
                                                      .withOpacity(1),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Image.asset(
                                                  "assets/images/${getList[index].imageName}.png",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              Visibility(
                                                visible: state
                                                        .suplementList[index]
                                                        .isPrescription ??
                                                    false,
                                                child: Positioned(
                                                  bottom: 0.0,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height: 21.0,
                                                    color: kBlackColor
                                                        .withOpacity(0.4),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: 20.0,
                                                        ),
                                                        child: Text(
                                                          "Requires a prescription",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "ProximaNovaFont",
                                                            fontSize: 12.0,
                                                            color:
                                                                kBackgroundColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 10.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${getList[index].name}",
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        "ProximaNovaFont",
                                                    fontSize: 16.0,
                                                    color: kBlackColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tablet ・${getList[index].tablet}",
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                "ProximaNovaFont",
                                                            fontSize: 14.0,
                                                            color:
                                                                kSecondaryColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Text(
                                                          "₦${state.suplementList[index].amount}.00",
                                                          style:
                                                              const TextStyle(
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
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 10.0,
                                                        ),
                                                        margin: const EdgeInsets
                                                            .only(left: 10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: kPrimaryColor
                                                              .withOpacity(0.1),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          "assets/svgs/Vector.svg",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InkResponse(
                                                  onTap: () {
                                                    try {
                                                      _cartCubit = CartCubit(
                                                          database: context
                                                              .read<
                                                                  DatabaseCubit>()
                                                              .database!);
                                                      if (_cartCubit == null) {
                                                        return;
                                                      } else {
                                                        _cartCubit?.addCarts(
                                                          getList[index]
                                                              .imageName!,
                                                          getList[index].name!,
                                                          getList[index]
                                                              .tablet!,
                                                          1,
                                                          getList[index]
                                                              .amount!,
                                                        );
                                                      }
                                                      showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              false,
                                                          builder: (context) {
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: ListView
                                                                  .builder(
                                                                itemCount: state
                                                                    .suplementList
                                                                    .length,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                physics:
                                                                    const BouncingScrollPhysics(),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return CartDialog(
                                                                      index:
                                                                          index);
                                                                },
                                                              ),
                                                            );
                                                          });
                                                    } catch (e) {
                                                      log(e.toString());
                                                    }
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 40.0,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 20.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        width: 2.0,
                                                        color: const Color(
                                                            0XFF822AF6),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "ADD TO CART",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "ProximaNovaFont",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0XFF822AF6),
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
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                },
              ],
            );
          } else if (state is SuplementError) {
            return Text(state.errorMessage);
          } else {
            return const Text("Loading");
          }
        },
      ),
    );
  }
}
