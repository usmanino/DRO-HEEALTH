import 'package:dro/controller/Bloc/cubit/categories_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:dro/model/supplements_model.dart';
import 'package:dro/ui/pharmacy/subView/categories_screen.dart';
import 'package:dro/ui/pharmacy/subView/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SuplementCategoriiesScreen extends StatefulWidget {
  final int index;
  String? categories;
  SuplementCategoriiesScreen({
    Key? key,
    required this.index,
    required this.categories,
  }) : super(key: key);

  @override
  State<SuplementCategoriiesScreen> createState() =>
      _SuplementCategoriiesScreenState();
}

class _SuplementCategoriiesScreenState
    extends State<SuplementCategoriiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Categories",
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
          const SizedBox(
            height: 20.0,
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
                                      setState(() {
                                        widget.categories =
                                            state.categoriseList[index].name;
                                      });
                                    },
                                    child: Container(
                                      height: 130.0,
                                      width: 190.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            state.categoriseList[index].image,
                                          ),
                                          fit: BoxFit.fill,
                                          colorFilter: widget.categories ==
                                                  state.categoriseList[index]
                                                      .name
                                              ? ColorFilter.mode(
                                                  kPrimaryColor
                                                      .withOpacity(0.9),
                                                  BlendMode.modulate,
                                                )
                                              : null,
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
                                }),
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
                  BlocConsumer<SuplementCubit, SuplementState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is SuplementSuccess) {
                        List<SupplementModle> me = state.suplementList;

                        var getCategories = me.where((element) {
                          return element.categories
                              .toString()
                              .contains(widget.categories!);
                        }).toList();
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
                            itemCount: getCategories.length,
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
                                                  color: const Color(0XFFDEEBEE)
                                                      .withOpacity(1),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Image.asset(
                                                  "assets/images/${getCategories[index].imageName}.png",
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
                                                  "${getCategories[index].name}",
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        "ProximaNovaFont",
                                                    fontSize: 16.0,
                                                    color: kBlackColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  "Tablet・${getCategories[index].tablet}",
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        "ProximaNovaFont",
                                                    fontSize: 14.0,
                                                    color: kSecondaryColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 9.0,
                                                ),
                                                Text(
                                                  "₦${getCategories[index].amount}.00",
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        "ProximaNovaFont",
                                                    fontSize: 18.0,
                                                    color: kBlackColor,
                                                    fontWeight: FontWeight.w600,
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
                            },
                          ),
                        );
                      } else if (state is SuplementError) {
                        return Text(state.errorMessage);
                      } else {
                        return const Text("Loading");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
