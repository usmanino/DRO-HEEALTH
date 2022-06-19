import 'package:dro/controller/Bloc/cubit/categories_cubit.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/core/top_app_bar.dart';
import 'package:dro/ui/pharmacy/subView/suplements_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriiesScreen extends StatefulWidget {
  const CategoriiesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriiesScreen> createState() => _CategoriiesScreenState();
}

class _CategoriiesScreenState extends State<CategoriiesScreen> {
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
          BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is CategoriesSuccess) {
                return Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 230,
                        mainAxisExtent: 160,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.categoriseList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SuplementCategoriiesScreen(
                                  index: index,
                                  categories: state.categoriseList[index].name,
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                      }),
                );
              } else if (state is CategoriesError) {
                return Text(state.errorMessage);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
