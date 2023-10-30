import 'package:erikum_music_player/constants/colors.dart';
import 'package:erikum_music_player/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: darkColor,
          elevation: 0,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}
