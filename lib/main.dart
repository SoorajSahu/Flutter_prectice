import 'package:flutter/material.dart';
import 'package:medxcart_app/pages/splashscreen.dart';
import 'package:medxcart_app/pages/signup.dart';
import 'package:medxcart_app/pages/verifyotp.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/start',
      routes: {
        '/start': (context) => SplashScreen(),
        '/signup': (context) => Signup(),
        '/otpVarify': (context) => OtpVarify()
      },
    ));