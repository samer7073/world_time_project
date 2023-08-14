// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_time_world_application/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  
  

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", urll: "Europe/Berlin");
    await instance.getTime();
    /*
    print(instance.time);
    setState(() {
      time = instance.time;
    });
    */
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "Daytime": instance.Daytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: SpinKitFoldingCube(
              color: Colors.white,
              size: 100.0,
            ),
          )),
    );
  }
}
