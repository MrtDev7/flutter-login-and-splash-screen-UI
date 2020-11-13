import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_ui/ui/screens/screens.dart';
import 'package:login_ui/ui/style.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> bottomContainerAnimation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    bottomContainerAnimation =
        Tween<double>(begin: -400, end: 0).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            left: 0,
            right: 0,
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
          Positioned(
            bottom: bottomContainerAnimation.value,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Color(KPrimaryColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores similique repudiandae cum omnis pariatur ipsa, impedit nemo facilis? A officiis nemo obcaecati asperiores tenetur consequatur incidunt perferendis ipsum quo labore!',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoginButtonInWelcomeContainer(
                          color: Colors.black,
                          lable: 'Sign In',
                          onTap: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        LoginButtonInWelcomeContainer(
                          color: Colors.white,
                          lable: 'Sign Up',
                          onTap: () {
                            print('sign up');
                          },
                          textColor: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
      ;
    },
  );
}

class LoginButtonInWelcomeContainer extends StatelessWidget {
  final Color color;
  final String lable;
  final Function onTap;
  final Color textColor;
  const LoginButtonInWelcomeContainer({
    Key key,
    @required this.color,
    @required this.lable,
    @required this.onTap,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 50,
            ),
            decoration: BoxDecoration(),
            child: Text(
              lable,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
