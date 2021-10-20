import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:page_transition/page_transition.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: Image.network("https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3cyUyMHBhcGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80s",fit: BoxFit.cover,),
        nextScreen: homeScreen(),
        backgroundColor: Colors.black,
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        
      ),
    );
  }
}

