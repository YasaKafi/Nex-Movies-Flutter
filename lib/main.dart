import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_flutter_app/helpers/themes.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/views/NavigationBar.dart';

void main(){

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: backgroundColor,
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),

    );
  }
}


