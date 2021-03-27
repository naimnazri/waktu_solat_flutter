import 'package:flutter/material.dart';
import 'package:adhan_time/pages/home.dart';
import 'package:adhan_time/pages/loading.dart';

void main() =>  runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  },
));





