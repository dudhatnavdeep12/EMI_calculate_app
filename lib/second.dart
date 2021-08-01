import 'package:flutter/material.dart';
import 'package:validator_emi_calculator/logic.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final String emi = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.indigo,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: NetworkImage(
                "https://is1-3.housingcdn.com/4f2250e8/be4a9354214138cc131480eeb52e97b8/v0/fs/riddhi_yash_icon-raysan_gandhinagar_district-gandhinagar-riddhi_developer.jpeg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your loan EMI is",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Text(
              ("₹${emi.toString()}"),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            Text("per month",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Finish",
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
