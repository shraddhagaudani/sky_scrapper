import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () {
    //
    //   },
    // );
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/').then(
            (value) => setState(() {}),
          );
    },);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo1.png",height: 300,width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
