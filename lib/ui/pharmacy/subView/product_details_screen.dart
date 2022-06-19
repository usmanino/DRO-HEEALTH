import 'dart:developer';

import 'package:dro/controller/Bloc/cubit/cart_cubit.dart';
import 'package:dro/controller/Bloc/cubit/database_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/cart_dialog.dart';
import 'package:dro/core/messages.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatefulWidget {
  int index;
  int amount;
  ProductDetailsScreen({Key? key, required this.index, required this.amount})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int iteamCount = 1;
  int? amount;
  //String? image, name, tablet;
  CartCubit? _cartCubit;

  @override
  void initState() {
    super.initState();
    amount = widget.amount;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
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
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset("assets/svgs/back.svg"),
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
                    SizedBox(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0.0,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0XFFF2C94C),
                              ),
                            ),
                          ),
                          SvgPicture.asset("assets/svgs/chart.svg"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          BlocBuilder<SuplementCubit, SuplementState>(
            builder: (context, state) {
              if (state is SuplementSuccess) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/${state.suplementList[widget.index].imageName}.png",
                                      width: MediaQuery.of(context).size.width /
                                          2.4,
                                    ),
                                    Text(
                                      "${state.suplementList[widget.index].name}",
                                      style: const TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        fontWeight: FontWeight.bold,
                                        color: kBlackColor,
                                        fontSize: 22.0,
                                        letterSpacing: 1.0,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      "Tablet・${state.suplementList[widget.index].tablet}",
                                      style: TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        fontWeight: FontWeight.w400,
                                        color: kBlackColor.withOpacity(0.5),
                                        fontSize: 18.0,
                                        letterSpacing: 1.0,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/mzorLogo.png",
                                          width: 50.0,
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "SOLD BY",
                                              style: TextStyle(
                                                fontFamily: "ProximaNovaFont",
                                                fontWeight: FontWeight.w400,
                                                color: Color(0XFF8EA5BC),
                                                fontSize: 13.0,
                                                letterSpacing: 1.0,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                            Text(
                                              "${state.suplementList[widget.index].name}",
                                              style: const TextStyle(
                                                fontFamily: "ProximaNovaFont",
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF13447A),
                                                fontSize: 15.0,
                                                letterSpacing: 1.0,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: kPrimaryColor.withOpacity(0.1),
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/svgs/Vector.svg",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                BlocConsumer<SuplementCubit, SuplementState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                  },
                                  builder: (context, state) {
                                    if (state is SuplementSuccess) {
                                      int _amount = int.parse(state
                                          .suplementList[widget.index].amount
                                          .toString());
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.0,
                                                    color: kPrimaryIconColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (iteamCount <= 1) {
                                                            iteamCount = 1;
                                                          } else {
                                                            iteamCount--;
                                                          }
                                                          // calculate the amount of total product
                                                          int displayAmount =
                                                              _amount *
                                                                  iteamCount;
                                                          amount =
                                                              displayAmount;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                        0.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      iteamCount.toString(),
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "ProximaNovaFont",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: kBlackColor,
                                                        fontSize: 20.0,
                                                        letterSpacing: 1.0,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (iteamCount > 7) {
                                                            displayErrorMessage(
                                                              error:
                                                                  " That is the Maximum Item you can add!",
                                                              context:
                                                                  _dialogKey,
                                                              scaffoldKey:
                                                                  _scaffoldKey,
                                                              popStack: false,
                                                            );
                                                            return;
                                                          } else {
                                                            iteamCount++;
                                                          }
                                                          // calculate the amount of total product
                                                          int displayAmount =
                                                              _amount *
                                                                  iteamCount;
                                                          amount =
                                                              displayAmount;
                                                        });
                                                      },
                                                      icon:
                                                          const Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                "Pack(s)",
                                                style: TextStyle(
                                                  fontFamily: "ProximaNovaFont",
                                                  fontWeight: FontWeight.w400,
                                                  color: kBlackColor
                                                      .withOpacity(0.6),
                                                  fontSize: 14.0,
                                                  letterSpacing: 1.0,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 30.0,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20.0),
                                                  child: Text(
                                                    "₦",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "ProximaNovaFont",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: kBlackColor,
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${amount ?? state.suplementList[widget.index].amount}",
                                                          maxLines: 1,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                "ProximaNovaFont",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: kBlackColor,
                                                            fontSize: 27.0,
                                                            letterSpacing: 1.0,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 10.0,
                                                          ),
                                                          child: Text(
                                                            ".00",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "ProximaNovaFont",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  kBlackColor,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  1.0,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    } else if (state is SuplementError) {
                                      return Text(state.errorMessage);
                                    } else {
                                      return const Text("Loading");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "PRODUCT DETAILS",
                                      style: TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        fontWeight: FontWeight.w700,
                                        color: Color(0XFF8EA5BC),
                                        fontSize: 17.0,
                                        letterSpacing: 1.0,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        ProductDetails(
                                          title: "PACK SIZE",
                                          subTitle: "8 x 12 tablets (96)",
                                          imageName: "drag",
                                        ),
                                        ProductDetails(
                                          title: "PRODUCT ID",
                                          subTitle: "PRO23648856",
                                          imageName: "scanner",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        ProductDetails(
                                          title: "PACK SIZE",
                                          subTitle: "8 x 12 tablets (96)",
                                          imageName: "tablets",
                                        ),
                                        ProductDetails(
                                          title: "PRODUCT ID",
                                          subTitle: "PRO23648856",
                                          imageName: "dispense",
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
                                      style: TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        fontWeight: FontWeight.w400,
                                        color: kBlackColor.withOpacity(0.4),
                                        fontSize: 14.0,
                                        letterSpacing: 1.0,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "Similar Products",
                                      style: TextStyle(
                                        fontFamily: "ProximaNovaFont",
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor.withOpacity(0.6),
                                        fontSize: 18.0,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      height: 220,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: ListView.builder(
                                            itemCount:
                                                state.suplementList.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return InkResponse(
                                                onTap: () {
                                                  setState(() {
                                                    widget.index = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    width: 180,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        20.0,
                                                      ),
                                                      color: kBackgroundColor,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color:
                                                              kSecondaryColor,
                                                          offset:
                                                              Offset(0.0, 0.0),
                                                          blurRadius: 3,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      10.0,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      10.0,
                                                                    ),
                                                                  ),
                                                                  color: const Color(
                                                                          0XFFDEEBEE)
                                                                      .withOpacity(
                                                                          1),
                                                                ),
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/${state.suplementList[index].imageName}.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible: state
                                                                        .suplementList[
                                                                            index]
                                                                        .isPrescription ??
                                                                    false,
                                                                child:
                                                                    Positioned(
                                                                  bottom: 0.0,
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        2,
                                                                    height:
                                                                        21.0,
                                                                    color: kBlackColor
                                                                        .withOpacity(
                                                                            0.4),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          right:
                                                                              20.0,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "Requires a prescription",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                "ProximaNovaFont",
                                                                            fontSize:
                                                                                12.0,
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
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 10.0,
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(
                                                                  height: 10.0,
                                                                ),
                                                                Text(
                                                                  "${state.suplementList[index].name}",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        "ProximaNovaFont",
                                                                    fontSize:
                                                                        16.0,
                                                                    color:
                                                                        kBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Tablet・${state.suplementList[index].tablet}",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        "ProximaNovaFont",
                                                                    fontSize:
                                                                        14.0,
                                                                    color:
                                                                        kSecondaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 9.0,
                                                                ),
                                                                Text(
                                                                  "₦${state.suplementList[index].amount}.00",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        "ProximaNovaFont",
                                                                    fontSize:
                                                                        18.0,
                                                                    color:
                                                                        kBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    letterSpacing:
                                                                        0.5,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            try {
                              _cartCubit = CartCubit(
                                  database:
                                      context.read<DatabaseCubit>().database!);
                              if (_cartCubit == null) {
                                return;
                              } else {
                                _cartCubit?.addCarts(
                                  state.suplementList[widget.index].imageName!,
                                  state.suplementList[widget.index].name!,
                                  state.suplementList[widget.index].tablet!,
                                  iteamCount,
                                  amount.toString(),
                                );
                              }
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return ListView.builder(
                                      itemCount: state.suplementList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return CartDialog(index: index);
                                      },
                                    );
                                  });
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 60.0,
                            margin: const EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: const LinearGradient(
                                end: Alignment(1.5, 0.0),
                                colors: <Color>[
                                  Color(0XFF822AF6),
                                  kPrimaryColor,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svgs/chart.svg"),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    fontFamily: "ProximaNovaFont",
                                    fontWeight: FontWeight.w700,
                                    color: kBackgroundColor,
                                    fontSize: 17.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is SuplementError) {
                return Text(state.errorMessage);
              } else {
                return const Text("Loading");
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageName;
  const ProductDetails({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/svgs/$imageName.svg"),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "ProximaNovaFont",
                fontWeight: FontWeight.w400,
                color: Color(0XFF8EA5BC),
                fontSize: 13.0,
                letterSpacing: 1.0,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontFamily: "ProximaNovaFont",
                fontWeight: FontWeight.w700,
                color: Color(0XFF13447A),
                fontSize: 15.0,
                letterSpacing: 1.0,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
