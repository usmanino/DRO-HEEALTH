import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  Database? database;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'cart.db');
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table

        await db.execute(
          'CREATE TABLE cart (id INTEGER PRIMARY KEY, image TEXT, name TEXT, tablet TEXT, items INTEGER, amount TEXT)',
        );
      });
      emit(DatabaseloadState());
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
            'CREATE TABLE cart (id INTEGER PRIMARY KEY, image TEXT, name TEXT, tablet TEXT, items INTEGER, amount TEXT)',
          );
        });
        emit(DatabaseloadState());
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
