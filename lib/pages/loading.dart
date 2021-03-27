import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:adhan_time/services/adhan_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupAdhanTime() async{
    AdhanTime instance = AdhanTime(latitude: 3.1390, longitude: 101.9758, url: 'Asia/Kuala_Lumpur');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'subuh': instance.subuh,
      'syuruk': instance.syuruk,
      'zuhur': instance.zuhur,
      'asar': instance.asar,
      'magh': instance.magh,
      'isyak': instance.isyak,
      'isDaytime': instance.isDaytime,
      'diff_syuruk': instance.final_diff_syuruk,
      'diff_magh': instance.final_diff_magh,
    });
  }

  @override
  void initState() {
    super.initState();
    setupAdhanTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
