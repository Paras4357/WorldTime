import 'package:flutter/material.dart';
import 'package:worldtime/Pages/HomeScreen.dart';
import 'package:worldtime/Pages/Loading.dart';
import 'package:worldtime/Pages/ChooseLocation.dart';

void main(){
  return runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) =>  Loading(),
      '/home' : (context) =>  Home(),
      '/chooseLocation': (context) =>  ChooseLocation(),
    },
  ));
}

