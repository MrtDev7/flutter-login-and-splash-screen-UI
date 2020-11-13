import 'package:flutter/material.dart';
import 'package:login_ui/ui/screens/screens.dart';
import 'package:login_ui/ui/style.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(KPrimaryColor),
       
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
