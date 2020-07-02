import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';
  void setupWorldTime() async {

    WorldTime instance = WorldTime(location: 'Kolkatta',flag:'germany.png',url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'dayOrNight': instance.isDayOrNight,
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
      backgroundColor: Colors.blue,
      body: Center(
        child:SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      );

  }
}


