import 'package:api_call_app/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp( GetMaterialApp(
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: true
    ),
    home: const Homeview(),
  ));
}