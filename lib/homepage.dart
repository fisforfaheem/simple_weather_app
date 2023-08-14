// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/get_location.dart';
import 'package:simple_weather_app/weather_data.dart';
import 'package:intl/intl.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
  var client = WeatherDate();
  var data;

  MyHomePage({super.key});

  info() async {
    var position = await getPosition();
    data = await client.getData(position.latitude, position.longitude);
    //!testing
    // data = await client.getData(36.37, 6.61);

    return data;
  }
  // Future<void> _refreshData() async {
  //   var position = await getPosition();
  //   data = await client.getData(position.latitude, position.longitude);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body:
          // RefreshIndicator(
          //    onRefresh: _refreshData,
          //   child:

          FutureBuilder(
              future: info(),
              builder: (context, snapshot) {
                return Container(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.75,
                          width: size.width,
                          padding: const EdgeInsets.only(top: 20),
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
                                '${data?.cityName}',
                                style: GoogleFonts.mavenPro(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 60,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                dateFormat,
                                style: GoogleFonts.mavenPro(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                'https:${data?.icon}',
                                width: size.width * 0.3,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data?.condition}',
                                style: GoogleFonts.hubballi(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${data?.temp}',
                                style: GoogleFonts.hubballi(
                                  color: Colors.white,
                                  fontSize: 75,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                          '${data?.wind} km/h',
                                          style: GoogleFonts.hubballi(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'wind',
                                          style: GoogleFonts.mavenPro(
                                              color:
                                                  Colors.white.withOpacity(0.6),
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
                                          '${data?.humidity}%',
                                          style: GoogleFonts.hubballi(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'Humidity',
                                          style: GoogleFonts.mavenPro(
                                              color:
                                                  Colors.white.withOpacity(0.6),
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
                                          '${data?.windDir}',
                                          style: GoogleFonts.hubballi(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'Wind Direction',
                                          style: GoogleFonts.mavenPro(
                                              color:
                                                  Colors.white.withOpacity(0.6),
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
                                    '${data?.gust} kp/h',
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
                                    '${data?.pressure} hPa',
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
                                    '${data?.uv}',
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
                                    '${data?.precipitation} mm',
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
                                    '${data?.wind}',
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
                                    '${data?.lastUpdate}',
                                    style: GoogleFonts.mavenPro(
                                        color: Colors.green, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
    ));
  }
}
