import 'dart:convert';

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
      future: http.get("https://coronavirus-19-api.herokuapp.com/all"),
      builder: (context,snapshot){
        if (snapshot.hasData){
          var value = snapshot.data;
          var decodedJson = json.decode(value.body);
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/personFighting.png"),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,0,0),
                          child: Text("Global Covid-19",style: TextStyle(fontSize: 35),),
                        )),
                    SizedBox(height: 20,),
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
                                  padding: const EdgeInsets.fromLTRB(20,40,0,0),
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
                        width: 340,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(220,28,49,1),
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
                                  padding: const EdgeInsets.fromLTRB(20,40,0,0),
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
                              color: Colors.blueAccent,
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
                              padding: EdgeInsets.fromLTRB(60,0,0,0),
                              child: Image.network("https://raw.githubusercontent.com/m-hamzashakeel/Covid19-Tracker-App/master/images/recover.png",scale: 1.5,),
                            )
                          ],
                        )
                    )

                  ],
                ),

              ),
            ),
          );
        }
        else{
          return Scaffold(
            body: Center(child: SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),),
          );
        }
      },
    );
  }
}
