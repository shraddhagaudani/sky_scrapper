import 'package:flutter/material.dart';

class Weather_Model {
  String locationname;
  String region;
  String country;
  String tzid;
  // double localtime;
  double currentcelcius;
  double currentferanhit;
  String lastupdated;
  String date;
  double maxcel;
  double mincel;
  double maxfer;
  double minfer;
  double avragefer;
  double avragecel;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String cloud;
  String icon;

  Weather_Model({
    required this.locationname,
    required this.region,
    required this.country,
    required this.tzid,
    // required this.localtime,
    required this.currentcelcius,
    required this.currentferanhit,
    required this.lastupdated,
    required this.date,
    required this.mincel,
    required this.maxcel,
    required this.maxfer,
    required this.minfer,
    required this.avragefer,
    required this.avragecel,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.cloud,
    required this.icon,
  });

  factory Weather_Model.fromMap({required Map data}) {
    return Weather_Model(
      locationname: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      tzid: data['location']['tz_id'],
      // localtime: data['location']['localtime'][0],
      currentcelcius: data['current']['temp_c'],
      currentferanhit: data['current']['temp_f'],
      lastupdated: data['current']['last_updated'],
      date: data['forecast']['forecastday'][0]['date'],
      mincel: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxcel: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minfer: data['forecast']['forecastday'][0]['day']['mintemp_f'],
      maxfer: data['forecast']['forecastday'][0]['day']['maxtemp_f'],
      avragecel: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
      avragefer: data['forecast']['forecastday'][0]['day']['avgtemp_f'],
      sunrise: data['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: data['forecast']['forecastday'][0]['astro']['sunset'],
      moonrise: data['forecast']['forecastday'][0]['astro']['moonrise'],
      moonset: data['forecast']['forecastday'][0]['astro']['moonset'],
      cloud: data['forecast']['forecastday'][0]['day']['condition']['text'],
      icon: data['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
