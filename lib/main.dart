import 'package:flutter/material.dart';
import 'dart:async';
import 'homepage.dart';
import 'skin_infectionpages/skinimage_selection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context)=> MyHomePage(),
        '/skin_infections': (context)=> ChooseSkinImage(),
      },
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3), ()=> Navigator.pushReplacementNamed(context, '/home'));
  }

  Widget gapping(Widget widget){
    return Padding(child: widget, padding: EdgeInsets.all(20),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.greenAccent[400],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_atm),
            gapping(
              Text('Infeq',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 50,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
              ),
              )
            ),
            gapping(
              Text("one moment please",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30
              ),),
            ),

            gapping(CircularProgressIndicator()),
          ],
        ),
      ),
    ),
    );
  }
}