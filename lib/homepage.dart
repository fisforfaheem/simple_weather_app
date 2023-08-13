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
                    borderRadius: BorderRadius.circular(35),
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
                        height: 5,
                      ),
                      Text(
                        'Monday, 22 Aug',
                        style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Image.asset(
                        'assets/img/sunny.png',
                        width: size.width * 0.4,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sunny',
                        style: GoogleFonts.hubballi(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        '32°',
                        style: GoogleFonts.hubballi(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/wind.png',
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  '17.1 km/h',
                                  style: GoogleFonts.hubballi(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'wind',
                                  style: GoogleFonts.hubballi(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/cloudy.png',
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  '61',
                                  style: GoogleFonts.hubballi(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Humidity',
                                  style: GoogleFonts.hubballi(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/cloudy_rainy.png',
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  '61',
                                  style: GoogleFonts.hubballi(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Wind Direction',
                                  style: GoogleFonts.hubballi(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Gust',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '32.0 kp/h',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white, fontSize: 23),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Pressure',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1025.0 hPa',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white, fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'UV',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1.0',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white, fontSize: 23),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Precipitation',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '0.0 mm',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white, fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Wind',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '19.1 km /h',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white, fontSize: 23),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Last Update',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2023 08 22',
                            style: GoogleFonts.mavenPro(
                                color: Colors.green, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
