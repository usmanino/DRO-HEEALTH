import 'package:dro/controller/Bloc/cubit/categories_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:dro/ui/pharmacy/subView/cart_screen.dart';
import 'package:dro/ui/pharmacy/subView/product_details_screen.dart';
import 'package:dro/ui/pharmacy/subView/search_products_screen.dart';
import 'package:dro/ui/pharmacy/subView/suplements_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'subView/categories_screen.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        child: Container(
          height: 43.0,
          width: 135.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Checkout",
                style: TextStyle(
                  fontFamily: "ProximaNovaFont",
                  fontSize: 14.0,
                  color: kBackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SvgPicture.asset("assets/svgs/chart.svg"),
              const CircleAvatar(
                radius: 12,
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
            ],
          ),
        ),
      ),
      body: Column(
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
                          height: 60.0,
                          color: kSecondaryBorder,
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 10.0,
                          ),
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svgs/location.svg"),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          SvgPicture.asset("assets/svgs/delivery.svg")
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SearchProductsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: kPrimaryColor.withOpacity(0.7),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.search_rounded,
                                color: kPrimaryIconColor,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                  fontFamily: "ProximaNovaFont",
                                  color: kPrimaryIconColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "CATEGORIES",
                        style: TextStyle(
                          fontFamily: "ProximaNovaFont",
                          fontSize: 16.0,
                          color: kSecondaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoriiesScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "VIEW ALL",
                          style: TextStyle(
                            fontFamily: "ProximaNovaFont",
                            fontSize: 14.0,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocConsumer<CategoriesCubit, CategoriesState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is CategoriesSuccess) {
                        return SizedBox(
                          height: 120,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              itemCount: state.categoriseList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SuplementCategoriiesScreen(
                                          index: index,
                                          categories:
                                              state.categoriseList[index].name,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 130.0,
                                    width: 190.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          state.categoriseList[index].image,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.categoriseList[index].name,
                                        style: const TextStyle(
                                          fontFamily: "ProximaNovaFont",
                                          fontSize: 15.0,
                                          color: kPrimaryIconColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else if (state is CategoriesError) {
                        return Text(state.errorMessage);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  const Text(
                    "SUPPLEMENTS",
                    style: TextStyle(
                      fontFamily: "ProximaNovaFont",
                      fontSize: 16.0,
                      color: kSecondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  BlocBuilder<SuplementCubit, SuplementState>(
                    builder: (context, state) {
                      if (state is SuplementSuccess) {
                        return Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                mainAxisExtent: 250,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: state.suplementList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                          index: index,
                                          amount: int.parse(
                                            state.suplementList[index].amount
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  child: Padding(
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
                                                    color:
                                                        const Color(0XFFDEEBEE)
                                                            .withOpacity(1),
                                                  ),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Image.asset(
                                                    "assets/images/${state.suplementList[index].imageName}.png",
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: state
                                                          .suplementList[index]
                                                          .isPrescription ??
                                                      false,
                                                  child: Positioned(
                                                    bottom: 23.0,
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
                                                                  FontWeight
                                                                      .w400,
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
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${state.suplementList[index].name}",
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          "ProximaNovaFont",
                                                      fontSize: 16.0,
                                                      color: kBlackColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Tablet・${state.suplementList[index].tablet}",
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
                                                    "₦${state.suplementList[index].amount}.00",
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
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
            ),
          ),
        ],
      ),
    );
  }
}
