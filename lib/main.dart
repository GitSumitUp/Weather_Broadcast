import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
import 'package:weather_app/Activity/loading.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
         "/" : (context) => Loading(),
         "/home": (context) => Home(),
         "/loading" : (context) => Loading(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return const Scaffold(

    );
  }
}
