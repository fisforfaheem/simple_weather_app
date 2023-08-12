// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Center(
            child: Column(
          children: [
            Container(
              height: size.height * 0.75,
              width: size.width,
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [
                    //pink and blue
                    Color(0xFF955cd1),
                    Color(0xFF35a2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Weather app',
                    style: GoogleFonts.mavenPro(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Monday, 22 Aug',
                    style: GoogleFonts.mavenPro(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 15,
                    ),
                  ),
                  Image.asset('assets/img/cloudy.png'),
                ],
              ),
            ),
          ],
        )),
      )),
    );
  }
}
