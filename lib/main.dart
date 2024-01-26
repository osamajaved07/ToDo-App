// ignore_for_file: prefer_const_constructors

// import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos_app/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}



class Home extends StatelessWidget {
  const Home({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


