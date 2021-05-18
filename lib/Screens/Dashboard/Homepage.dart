import 'dart:convert';

import 'package:covid_infos/Basic_infos_about_Covid/General/Vaccine.dart';
import 'package:covid_infos/Basic_infos_about_Covid/General/funding.dart';
import 'package:covid_infos/Basic_infos_about_Covid/General/govtinfo.dart';
import 'package:covid_infos/Basic_infos_about_Covid/General/twittersearch.dart';
import 'package:covid_infos/Basic_infos_about_Covid/Hospital/hospitals.dart';
import 'package:covid_infos/DataFetching/Worlddata.dart';
import 'package:covid_infos/Screens/Covidcases/CountryWise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    var breadth=MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: worlddata().world(),
      builder: (context,snapshot){
        if (snapshot.hasData){
          var value = snapshot.data;
          var decodedJson = json.decode(value.body);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/personFighting.png"),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25,10,0,0),
                            child: Text("Global Covid-19",style: TextStyle(fontSize: 35,fontFamily: "Sergoeui",fontWeight: FontWeight.bold),),
                          )),
                      SizedBox(height: 15,),
                      Container(
                          height: 130,
                          width: breadth-40,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,40,0,0),
                                    child: Text("TOTAL Cases",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                  Text(decodedJson["cases"].toString(),style: TextStyle(fontSize: 23,color: Colors.white),)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(80,0,0,0),
                                child: Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/covidBlue.png",scale: 1.5,),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 10,),
                      Container(
                          height: 130,
                          width: breadth-40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(220,28,49,1),
                              border: Border.all(
                                color: Color.fromRGBO(220,28,49,1),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),

                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,40,0,0),
                                    child: Text("TOTAL Death",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                  Text(decodedJson["deaths"].toString(),style: TextStyle(fontSize: 23,color: Colors.white),)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(80,0,0,0),
                                child: Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/death.png",scale: 1.5,),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 130,
                        width: breadth-40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(10,190,60,1),
                            border: Border.all(
                              color: Color.fromRGBO(10,190,60,1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,40,0,0),
                                  child: Text("TOTAL Recovery",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                                ),
                                Text(decodedJson["recovered"].toString(),style: TextStyle(fontSize: 23,color: Colors.white),)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50,0,0,0),
                              child: Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/recover.png",scale: 1.5,),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("ADDITIONAL INFOS",style: TextStyle(fontFamily: "SurfingCapital",fontSize: 35,color: Colors.red,fontWeight: FontWeight.w600,letterSpacing: 2),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => hospital()));
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [Color(0xFF614385),Color(0xFF516395)]),
                                    color: Colors.red,
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                height: 140,
                                width: 180,
                                child: Center(
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                          child: Icon(Icons.local_hospital_outlined,size: 30,color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                          child: Text("Hospitals",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                        ),

                                      ],
                                    )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => govtinfo()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,2,2,2),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF4568dc),Color(0xFFb06ab3)]),
                                      border: Border.all(
                                        color: Color.fromRGBO(10,190,60,1),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.info,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                            child: Text("Govt Info",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => twittersearch()));
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                    border: Border.all(
                                      color: Colors.black
                                      ,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                height: 140,
                                width: 180,
                                child: Center(
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                          child: Text("Twitter Search",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                        ),                                    ],
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5,2,2,2),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => vaccine()));
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF141e30),Color(0xFF243b55)]),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.local_hospital_outlined,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Text("Vaccine Avlbl",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CrowdFunding()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [Color(0xFFeb3349),Color(0xFFf45c43)]),
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            height: 140,
                            width: 180,
                            child: Center(
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                      child: Icon(Icons.money,size: 30,color: Colors.white,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                      child: Text("Donations",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                    ),

                                  ],
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("VERSION - 1.1.1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                    ],
                  ),

                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => country()));
                },
                  icon: Icon(Icons.flag,size: 30,),),
            ),
          );

        }
        else{
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitChasingDots(color: Colors.black,size: 100,),
                SizedBox(height: 50,),
                Text("Loading ...",style: TextStyle(fontSize: 26,color: Colors.red,fontWeight: FontWeight.bold),)
              ],
            ),
          );
        }
      },
    );

  }
}
