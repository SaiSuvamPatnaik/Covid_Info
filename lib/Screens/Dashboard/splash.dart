import 'package:covid_infos/Screens/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  List<Map<dynamic, dynamic>> onboardingData = [
    {
      "text1": "REAL TIME UPDATE",
      "text2": "Get daily updates about the covid cases all around the world",
      "image": "Assets/Images/mask-man.svg"
    },
    {
      "text1": "NOTIFIED INSTANTLY",
      "text2": "Get instant notification about the vaccine slots available in your city",
      "image": "Assets/Images/doctors1.svg"
    },
    {
      "text1": "SHARE INFOS",
      "text2":
      "Help other patients by sharing important informations about Beds,Oxygen,etc",
      "image": "Assets/Images/doctors2.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(onboardingData[index]["image"]),
//                      child: Image.asset(onboardingData[index]['image'],scale: 0.6,),
                    ),
                    onPageChanged: (value) => {
                      setState(() => {
                        currentPage = value,
                      })
                    },
                  ),
                ),
                SizedBox(height: 50,),
                Expanded(
                  flex:2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      color: Color.fromARGB(255, 65, 186, 139),
                    ),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      3, (index) => buildDot(index)))),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            onboardingData[currentPage]["text1"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width-20,
                            child: Text(
                              onboardingData[currentPage]["text2"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              child: Text(
                                currentPage == (onboardingData.length - 1)
                                    ? "NEXT"
                                    : "SKIP",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
                              onPressed: () =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Navigation())),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}








//import 'dart:async';
//import 'dart:io';
//import 'package:covid_infos/Screens/Dashboard/Homepage.dart';
//import 'package:covid_infos/Screens/Navigation.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:lottie/lottie.dart';
//class splash extends StatefulWidget {
//  @override
//  _splashState createState() => _splashState();
//}
//
//class _splashState extends State<splash> {
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    Timer(Duration(seconds: 6),()=>
//        Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => Navigation())));
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Padding(
//            padding: const EdgeInsets.fromLTRB(15,0,0,20),
//            child: Container(
//                height: 180,
//                width: 180,
//                child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_pKaMGF.json"))
//          ),
//          Padding(
//            padding: const EdgeInsets.fromLTRB(15,0,0,0),
//            child: SpinKitPouringHourglass(color: Colors.black,size: 70,),
//          ),
//          SizedBox(height: 30,),
//          Text("Stay Indoor | Stay Safe",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)
//        ],
//      ),
//
//    );
//  }
//}
