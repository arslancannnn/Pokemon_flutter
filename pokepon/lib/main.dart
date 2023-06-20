import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokepon/controller_bindings.dart';
import 'package:pokepon/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBind(),
      home: const Home(),
    );
  }
}
