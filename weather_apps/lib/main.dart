import 'package:flutter/material.dart';
import 'package:weather_apps/Activity/home.dart';
import 'package:weather_apps/Activity/loading.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => const Loading(),
      "/home" : (context) => const Home(),
      "/loading" : (context) => const Loading(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

