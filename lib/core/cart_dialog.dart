import 'package:dro/controller/Bloc/cubit/cart_cubit.dart';
import 'package:dro/controller/Bloc/cubit/database_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/ui/pharmacy/subView/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDialog extends StatefulWidget {
  final int index;
  CartDialog({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<CartDialog> createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          InkResponse(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: kBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<SuplementCubit, SuplementState>(
                    builder: (context, state) {
                      if (state is SuplementSuccess) {
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                              top: 30.0,
                              bottom: 40.0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Text(
                              "${state.suplementList[widget.index].name.toString()} successfully added to cart!",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "ProximaNovaFont",
                                fontWeight: FontWeight.w400,
                                color: kBlackColor,
                                fontSize: 20.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Text("Loading");
                      }
                    },
                  ),
                  InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60.0,
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
                      ),
                      child: const Center(
                        child: Text(
                          "VIEW CART",
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
                  InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60.0,
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0XFF822AF6),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "CONTINUE SHOPPING",
                          style: TextStyle(
                            fontFamily: "ProximaNovaFont",
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF822AF6),
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
          ),
        ],
      ),
    );
  }
}
