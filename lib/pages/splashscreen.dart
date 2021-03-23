import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context,'/signup');
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Image.asset('static/images/logo.png',width: 150,),
            Text(
              'Medxcart',
              style: GoogleFonts.openSans(
                  color: Colors.grey[800],
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 300,
            ),
            Container(
              child: Text('Order Medicine from anywhere',style: GoogleFonts.roboto(color: Colors.blueAccent),),
            )
          ],
        ),
      ),
    );
  }
}
