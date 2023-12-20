import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = info?['temp_value']?.toString()?.substring(0, 4) ?? '';
    String icon = info?['icon_value'] ?? '';
    String getcity = info?['city_value'] ?? '';
    String hum = info?['hum_value'] ?? '';
    String air = info?['air_speed_value']?.toString()?.substring(0, 4) ?? '';
    String des = info?['des_value'] ?? '';

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue[800]!, Colors.blue[300]!])),
            child: Column(
              children: [
                Container(


                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == "")
                          {
                            print("Blank search");
                          }else{
                            Navigator.pushReplacementNamed(context, "/loading",arguments: {
                              "searchText" : searchController.text,
                            });
                          }

                        },
                        child: Container(
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                               const SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("$des",style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal
                                  ),),
                                  Text("In $getcity",style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              )
                            ])),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                         const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const Icon(WeatherIcons.thermometer, size: 35,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: const TextStyle(

                                    fontSize: 82 ),),
                                const Text("℃",style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.normal
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          children: [
                             const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.cloudy_windy, size: 30,)
                              ],
                            ),
                            const SizedBox(height: 30,)
                            ,
                            Text("$air",style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            const Text("km/hr", style: TextStyle(fontSize: 19),)
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child:  SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                          children: [

                            const Row(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity, size:30)
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Text("$hum",style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            const Text("Percent", style: TextStyle(fontSize: 19),)
                          ],
                        ),
                       ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60,),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Sumit"),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}