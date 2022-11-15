// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print, unused_local_variable, unnecessary_string_interpolations

import 'package:cost_app/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  Database? database;
  List<Map> primeCostItems = [];
  List<Map> factoryOverHeadItems = [];
  List<Map> workInProgressItems = [];
  List<Map> finishedGoodsItems = [];
  List<Map> marketingitems = [];
  List<Map> administrativeitems = [];

  void createDataBase() {
    openDatabase("cost.db", version: 1, onCreate: (database, version) {
      database
          .execute(
            "CREATE TABLE items (id INTEGER PRIMARY KEY, title TEXT, category TEXT, price REAL)",
          )
          .then((value) {})
          .catchError((error) {
        print(error.toString());
      });
    }, onOpen: (database) {
      getDataFromgDatabase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    }).catchError((eror) {
      print(eror.toString());
    });
  }

  insertToDataBase({
    required String title,
    required String price,
    required String category,
  }) async {
    await database?.transaction((txn) {
      return txn
          .rawInsert(
        "INSERT INTO items(title, category, price) VALUES('$title','$category','$price')",
      )
          .then((value) {
        print("$value inserted");
        emit(AppInsertToDataBaseState());
        getDataFromgDatabase(database);
      }).catchError((error) {
        print(error.toString());
      });
    });
  }

  void getDataFromgDatabase(database) {
    primeCostItems = [];
    factoryOverHeadItems = [];
    workInProgressItems = [];
    finishedGoodsItems = [];
    marketingitems = [];
    administrativeitems = [];

    emit(AppGetDataFromDataBaseLoadingState());
    database.rawQuery("SELECT * FROM items").then((value) {
      value.forEach((element) {
        if (element['category'] == "Prime cost item") {
          primeCostItems.add(element);
        } else if (element['category'] == "Factory overhead item") {
          factoryOverHeadItems.add(element);
        } else if (element['category'] == "Work in progress item") {
          workInProgressItems.add(element);
        } else if (element['category'] ==
            "Opening and closing finished goods") {
          finishedGoodsItems.add(element);
        } else if (element['category'] == "Marketing expense") {
          marketingitems.add(element);
        } else {
          administrativeitems.add(element);
        }
      });
      emit(AppGetDataFromDataBaseState());
    });
  }

  void deleteDataFromDatabase({
    required int id,
  }) async {
    database!.rawDelete("DELETE FROM items WHERE id = ?", [id]).then((value) {
      getDataFromgDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  void changeBottomSheetState({
    required bool isShown,
    required IconData icon,
  }) {
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
