import 'dart:developer';

import 'package:dro/model/cart_model.dart';
import 'package:dro/repositorise/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final _cartRepo = CartRepository();
  final Database database;
  CartCubit({required this.database}) : super(const InitCartState(0));

  int _counter = 1;
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  Future<void> getCarts() async {
    try {
      _carts = await _cartRepo.getCart(database: database);
      emit(
        InitCartState(_counter++),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addCarts(
    String image,
    String name,
    String tablet,
    int items,
    String amount,
  ) async {
    try {
      await _cartRepo.addCart(
        database: database,
        image: image,
        name: name,
        tablet: tablet,
        items: items,
        amount: amount,
      );
      emit(InitCartState(_counter++));
      getCarts();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateCarts(
    int id,
    int items,
  ) async {
    try {
      await _cartRepo.updateCart(
        database: database,
        id: id,
        items: items,
      );
      emit(InitCartState(_counter++));
      getCarts();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeCart(int id) async {
    try {
      await _cartRepo.removeCart(database: database, id: id);
      emit(InitCartState(_counter++));
      getCarts();
    } catch (e) {
      log(e.toString());
    }
  }
}
