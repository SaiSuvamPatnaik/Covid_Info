import 'dart:async';
import 'package:covid_infos/Screens/Dashboard/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homepage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,0,0),
            child: Image.asset("Assets/Images/covidRed.png",scale: 0.9,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,0,0),
            child: SpinKitPouringHourglass(color: Colors.black,size: 70,),
          ),
          SizedBox(height: 30,),
          Text("Stay Indoor | Stay Safe",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)
        ],
      ),

    );
  }
}
