import 'package:flutter/material.dart';
import 'package:irisi/screens/delivery/delivery.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(
          seconds: 4,
        ), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DeliveryPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(height: 70, width: 60, color: Colors.red)),
    );
  }
}
