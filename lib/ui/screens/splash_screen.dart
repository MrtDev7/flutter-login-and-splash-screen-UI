import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_ui/ui/screens/screens.dart';
import 'package:login_ui/ui/style.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> topCircelAnimation;
  Animation<double> bottomCircelAnimation;
  Animation<double> logoAnimation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    topCircelAnimation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          print(topCircelAnimation.value);
        });
      });

    bottomCircelAnimation =
        Tween<double>(begin: 0, end: 350).animate(controller)
          ..addListener(() {
            setState(() {
              print(bottomCircelAnimation.value);
            });
          });

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          print(logoAnimation.value);
        });
      });
    controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (BuildContext context) => new WelcomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -50,
            right: -100,
            child: Container(
              height: topCircelAnimation.value,
              width: topCircelAnimation.value,
              decoration: BoxDecoration(
                color: Color(KPrimaryColor),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -150,
            child: Container(
              height: bottomCircelAnimation.value,
              width: bottomCircelAnimation.value,
              decoration: BoxDecoration(
                color: Color(KPrimaryColor),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: logoAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/splash_screen_logo.svg',
                    height: 80,
                    width: 80,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coffee',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'eveyone morning',
                    style: const TextStyle(
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
