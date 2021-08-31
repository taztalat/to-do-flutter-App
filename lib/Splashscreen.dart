import 'dart:async';
import 'package:flutter/material.dart';
import 'Todo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Todo())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child:Text("To-Do App", 
        style: TextStyle(
        color: Colors.grey[800],
       fontWeight: FontWeight.bold,
      fontSize: 40))
      ),
    );
  }
}




