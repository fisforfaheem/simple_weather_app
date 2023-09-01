// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:simple_weather_app/get_location.dart';
import 'package:simple_weather_app/weather_data.dart';
import 'package:simple_weather_app/weather_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var dayInfo = DateTime.now();
var timeInfo = TimeOfDay.now();

var dateFormat = DateFormat('EE, d MMM, yyyy').format(dayInfo);

class _MyHomePageState extends State<MyHomePage> {
  var client = WeatherDate();

  var details;

  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=82d2ce62cda64d45bc834631231408&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    print(body);
    return Weather.fromJson(body);
  }

  @override
  void initState() {
    details = info();
    dayInfo = DateTime.now();
    dateFormat = DateFormat('EE, d MMM, yyyy').format(dayInfo);
    super.initState();
  }

  info() async {
    var position = await getPosition();
    var data = getData(position.latitude, position.longitude);
    //!testing
    // data = await client.getData(36.37, 6.61);

    return data;
  }

  Future<void> _refreshData() async {
    var position = await getPosition();
    var data = getData(position.latitude, position.longitude);
    setState(() {});
  }

  Future<void> _handleRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          // key: _refreshIndicatorKey, // key if you want to add
          onRefresh: () {
            return Future.delayed(
                const Duration(
                  seconds: 1,
                ), () {
              setState(() {
                _refreshData();
              });
            });
          }, // refresh callback
          child: FutureBuilder(
              future: info() ??
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Weather data = snapshot.data as Weather;

                  return Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.75,
                              width: size.width,
                              padding: const EdgeInsets.only(top: 20),
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
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
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: InkWell(
                                        onTap: () {
                                          print("refresh button pressed");
                                          setState(() {
                                            dayInfo = DateTime.now();
                                            _refreshData();
                                          });
                                        },
                                        child: const Icon(
                                          Icons.refresh_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      )),
                                  Text(
                                    '${data.cityName}',
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
                                  // Image.network(
                                  //   'https:${data?.icon}',
                                  //   width: size.width * 0.3,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data.condition}',
                                    style: GoogleFonts.hubballi(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data.temp}',
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
                                              '${data.wind} km/h',
                                              style: GoogleFonts.hubballi(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'wind',
                                              style: GoogleFonts.mavenPro(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
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
                                              '${data.humidity}%',
                                              style: GoogleFonts.hubballi(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Humidity',
                                              style: GoogleFonts.mavenPro(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
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
                                              '${data.windDir}',
                                              style: GoogleFonts.hubballi(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Wind Direction',
                                              style: GoogleFonts.mavenPro(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
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
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${data.gust} kp/h',
                                        style: GoogleFonts.mavenPro(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Pressure',
                                        style: GoogleFonts.mavenPro(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${data.pressure} hPa',
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
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${data.uv}',
                                        style: GoogleFonts.mavenPro(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Precipitation',
                                        style: GoogleFonts.mavenPro(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${data.precipitation} mm',
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
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${data.wind}',
                                        style: GoogleFonts.mavenPro(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Last Update',
                                        style: GoogleFonts.mavenPro(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        dayInfo.second.toString(),
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
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
