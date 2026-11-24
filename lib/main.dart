import 'package:flutter/material.dart';
import 'package:online_mart/Bottom_Nav_Bar.dart';
import 'package:online_mart/Home_Screen.dart';
import 'package:online_mart/views/Order_Placed.dart';
import 'package:online_mart/Product_Details_Page.dart';
import 'package:online_mart/views/Splash_Screen.dart';
import 'package:online_mart/views/WellCome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

