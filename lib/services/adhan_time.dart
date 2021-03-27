import 'package:http/http.dart';
import 'dart:convert';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';


class AdhanTime{

  String subuh;
  String syuruk;
  String zuhur;
  String asar;
  String magh;
  String isyak;

  double latitude;
  double longitude;

  String time; // the time in that location
  String url; // location url for the api endpoint
  bool isDaytime; // true or false if daytime or nighttime

  String final_diff_syuruk;
  String final_diff_magh;

  AdhanTime({this.latitude,this.longitude,this.url});


  Future<void> getTime() async{

    try{

      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create Datetime Project
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime =  now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

      final malaysia = Coordinates(latitude, longitude);
      final nyUtcOffset = Duration(hours: 8);
      final nyDate = DateComponents.from(now);
      final nyParams = CalculationMethod.singapore.getParameters();
      nyParams.madhab = Madhab.shafi;
      final nyPrayerTimes = PrayerTimes(malaysia,nyDate, nyParams, utcOffset: nyUtcOffset);

      subuh = DateFormat.jm().format(nyPrayerTimes.fajr);
      syuruk = DateFormat.jm().format(nyPrayerTimes.sunrise);
      zuhur = DateFormat.jm().format(nyPrayerTimes.dhuhr);
      asar = DateFormat.jm().format(nyPrayerTimes.asr);
      magh = DateFormat.jm().format(nyPrayerTimes.maghrib);
      isyak = DateFormat.jm().format(nyPrayerTimes.isha);


      var today = now;

      var syurukTime = nyPrayerTimes.sunrise;
      Duration diff_syuruk = syurukTime.difference(today);
      var diff_syuruk_jam = diff_syuruk.inHours;
      var diff_syuruk_minit = diff_syuruk.inMinutes.remainder(60);
      final_diff_syuruk = '$diff_syuruk_jam Jam $diff_syuruk_minit Minit';

      var maghTime = nyPrayerTimes.maghrib;
      Duration diff_magh = maghTime.difference(today);
      var diff_magh_jam = diff_magh.inHours;
      var diff_magh_minit = diff_magh.inMinutes.remainder(60);
      final_diff_magh = '$diff_magh_jam Jam $diff_magh_minit Minit';




      //print(formatDate(nyPrayerTimes.sunrise, [HH, ':', nn]));



    }catch(e){
      print('caught error: $e');
      time = 'could not get time data';
    }

    //   print(DateFormat.jm().format(nyPrayerTimes.fajr));
//   print(DateFormat.jm().format(nyPrayerTimes.sunrise));
//   print(DateFormat.jm().format(nyPrayerTimes.dhuhr));
//   print(DateFormat.jm().format(nyPrayerTimes.asr));
//   print(DateFormat.jm().format(nyPrayerTimes.maghrib));
//   print(DateFormat.jm().format(nyPrayerTimes.isha));
  }

  //final malaysia = Coordinates(3.1390, 101.9758);
  // final nyUtcOffset = Duration(hours: 8);
  // final nyParams = CalculationMethod.singapore.getParameters();
  // nyParams.madhab = Madhab.shafi;
  // final nyPrayerTimes = PrayerTimes.today(malaysia, nyParams, utcOffset: nyUtcOffset);

}


// import 'package:adhan/adhan.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   print('Malaysia Prayer Times');
//   final myCoordinates =
//   Coordinates(3.184577, 101.738204); // Replace with your own location lat, lng.
//   final params = CalculationMethod.singapore.getParameters();
//   params.madhab = Madhab.shafi;
//   final prayerTimes = PrayerTimes.today(myCoordinates, params);
//
//   print(
//       "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
//   print(DateFormat.jm().format(prayerTimes.fajr));
//   print(DateFormat.jm().format(prayerTimes.sunrise));
//   print(DateFormat.jm().format(prayerTimes.dhuhr));
//   print(DateFormat.jm().format(prayerTimes.asr));
//   print(DateFormat.jm().format(prayerTimes.maghrib));
//   print(DateFormat.jm().format(prayerTimes.isha));
//
//   // Custom Timezone Usage. (Most of you won't need this).
//   print('Malaysia 2 Prayer Times');
//   final newYork = Coordinates(3.1390, 101.9758);
//   final nyUtcOffset = Duration(hours: 8);
//   //final nyDate = DateComponents(2021, 02, 01);
//   final nyParams = CalculationMethod.singapore.getParameters();
//   nyParams.madhab = Madhab.shafi;
//   final nyPrayerTimes = PrayerTimes.today(newYork, nyParams, utcOffset: nyUtcOffset);
//
//   print(nyPrayerTimes.fajr.timeZoneName);
//   print(DateFormat.jm().format(nyPrayerTimes.fajr));
//   print(DateFormat.jm().format(nyPrayerTimes.sunrise));
//   print(DateFormat.jm().format(nyPrayerTimes.dhuhr));
//   print(DateFormat.jm().format(nyPrayerTimes.asr));
//   print(DateFormat.jm().format(nyPrayerTimes.maghrib));
//   print(DateFormat.jm().format(nyPrayerTimes.isha));
//
// }