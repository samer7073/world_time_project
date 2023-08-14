import 'package:flutter/material.dart';
import 'package:flutter_time_world_application/pages/choose_location.dart';
import 'package:flutter_time_world_application/pages/home.dart';
import 'package:flutter_time_world_application/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLoading(),
    },
  ));
}
