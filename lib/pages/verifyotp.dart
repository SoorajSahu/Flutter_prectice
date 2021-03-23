import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medxcart_app/theme.dart';
import 'package:medxcart_app/widgets/customButton.dart';
import 'package:flutter_session/flutter_session.dart';

class NewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello bro'),
      color: Colors.lightBlueAccent,
    );
  }
}

class OtpVarify extends StatefulWidget {
  @override
  _OtpVarifyState createState() => _OtpVarifyState();
}

class _OtpVarifyState extends State<OtpVarify> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  dynamic phoneNum = FlutterSession().get('phoneNumber');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Verify OTP'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: FlutterSession().get('phoneNumber'),
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? snapshot.data.toString()
                      : 'Loading...');
                }),
            Text(
              'Please Enter OTP sent on your number.',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                )),
            SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonText: Text(
                'Verify Me',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                print('I am call');
              },
            )
          ],
        ),
      ),
    );
  }
}
