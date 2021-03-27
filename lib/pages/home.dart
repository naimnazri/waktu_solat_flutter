import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    //print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'WAKTU SOLAT MALAYSIA',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Subuh',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['subuh'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Syuruk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['syuruk'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    data['diff_syuruk'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Zuhur',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['zuhur'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Asar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['asar'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Maghrib',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['magh'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    data['diff_magh'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Isyak',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    data['isyak'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
