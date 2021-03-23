import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:medxcart_app/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

var session = FlutterSession();

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class PhoneOtp {
  final String phoneNumber;
  final String otp;
  PhoneOtp({this.phoneNumber, this.otp});
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String phoneNumber = "";

  void submitForm(String phoneNum) async {
    String sixDigitOtp = randomeOtp();
    
    await session.set("otp", "$sixDigitOtp");
    await session.set("phoneNumber", "$phoneNumber");
    print('Hello world');
    var json = jsonEncode(
        <String, String>{'phoneNumber': phoneNum, "otp": sixDigitOtp});
    // check the status code for the result
    final response = await http.post(
      Uri.https('api-medxcart.herokuapp.com', '/api/signup/sendOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );

    print(response.body);
  }

  String randomeOtp() {
    // Generate otp
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    return rndnumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: MyColors.primaryColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: MyColors.primaryColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'static/images/logo.png',
                  width: 150,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Your Name',
                      style: GoogleFonts.roboto(fontSize: 30),
                    ),
                    Text(
                      'Please confirm your country code and your phone number.',
                      style: GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              hoverColor: Colors.black,
                              prefixIcon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.grey[800],
                              ),
                              hintText: 'Enter Your Phone Number'),
                          validator: (value) {
                            if (value.isEmpty || value.length > 9)
                              return "Invalid Phone Number !";
                          },
                          onFieldSubmitted: (value) {
                            setState(() {
                              phoneNumber = value;
                              submitForm(phoneNumber);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(15),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/otpVarify');
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: MyColors.primaryColor)),
                      child: Text(
                        'SUBMIT',
                        style: GoogleFonts.lato(
                            fontSize: 23, color: MyColors.primaryColor),
                      ),
                      minWidth: 150,
                    ),
                    Text('$phoneNumber')
                  ],
                ),
              ),
            ),
            height: 500,
            alignment: Alignment.center,
          )
        ],
      ),
    ));
  }
}
