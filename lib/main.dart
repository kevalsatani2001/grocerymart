import 'package:flutter/material.dart';
import 'package:grocerymart/cartlist1.dart';
import 'package:grocerymart/kmart/Home_Grocery.dart';
import 'package:grocerymart/kmart/fruits_Page1.dart';
import 'package:grocerymart/kmart/home.dart';
import 'package:grocerymart/kmart/loginpage.dart';
import 'package:grocerymart/grocerywithoutmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const HomePageGrocery(),
      //home: const Login(),
      //home: const MyHome(),);
      //home: First_Frits());
      // home: const MyWidget(),
      home: const Cart_List(),
    );
  }
}
