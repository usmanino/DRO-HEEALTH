import 'dart:developer';

import 'package:dro/model/cart_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CartRepository {
  Future<List<CartModel>> getCart({required Database database}) async {
    List<CartModel> carts = [];
    try {
      final query = await database.rawQuery('SELECT * FROM cart');
      for (var items in query) {
        carts.add(CartModel(
          id: items['id'] as int,
          image: items['image'] as String,
          name: items['name'] as String,
          tablet: items['tablet'] as String,
          items: items['items'] as int,
          amount: items['amount'] as String,
        ));
      }
    } catch (e) {
      log(e.toString());
    }

    return carts;
  }

  Future<dynamic> removeCart({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM cart WHERE id = $id');
    });
  }

  Future<dynamic> addCart({
    required Database database,
    required String image,
    required String name,
    required String tablet,
    required int items,
    required String amount,
  }) async {
    return await database.transaction(
      (txn) async {
        await txn.rawInsert(
          "INSERT INTO cart(image, name, tablet, items, amount) VALUES ('$image','$name','$tablet','$items', '$amount')",
        );
      },
    );
  }

  Future<dynamic> updateCart({
    required Database database,
    required int id, 
    required int items, 
  }) async {
    return await database.transaction(
      (txn) async {
        await txn.rawUpdate(
          "UPDATE  cart SET items = '$items' WHERE id = '$id'",
        );
      },
    );
  }
}
