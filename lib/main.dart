// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:cost_app/modules/app_entrance.dart';
import 'package:cost_app/shared/constants.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: AppEntrance(),
    );
  }
}
