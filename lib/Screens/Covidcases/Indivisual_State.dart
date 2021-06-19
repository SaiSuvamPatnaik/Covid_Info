import 'dart:convert';

import 'package:covid_infos/DataFetching/indivisual_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class indivisualstate extends StatefulWidget {
  int index;
  String logo;
  List dailydata;

  indivisualstate({this.index,this.logo,this.dailydata});
  @override
  _indivisualstateState createState() => _indivisualstateState(index:index,logo:logo,dailydata:dailydata);
}

class _indivisualstateState extends State<indivisualstate> {
  int index;
  String logo;
  List dailydata;
  _indivisualstateState({this.index,this.logo,this.dailydata});
  var prefs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: statedata().statedata1(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var value = snapshot.data;
          var decodedjson = json.decode(value.body);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        child: Column(
                          children: [
                            CircleAvatar(
                                  radius: 55,
                                  child: Text(logo,style: TextStyle(fontSize:50,fontWeight: FontWeight.w500),),
                                ),
                            decodedjson["data"]["regional"][index]["loc"].length>16?
                            Text(decodedjson["data"]["regional"][index]["loc"],
                              style: TextStyle(fontSize:25,color: Colors.black,fontWeight: FontWeight.w600),):
                            Text(decodedjson["data"]["regional"][index]["loc"],
                              style: TextStyle(fontSize:40,color: Colors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height-200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  blurRadius: 15,
                                  spreadRadius: -1)
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)
                            ),

                          ),
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context,index1){
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0,20,0,0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: [Color(0xFF2193b0),Color(0xFF6dd5ed)]),

                                                  border: Border.all(
                                                    color: Colors.blueAccent,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                              ),
                                              height: 140,
                                              width: 160,
                                              child: Center(
                                                  child:
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("TL Cases",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                      Text(decodedjson["data"]["regional"][index]["totalConfirmed"].toString(),style: TextStyle(color: Colors.white,fontSize: 23),),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Padding(
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
                                                        colors: [Color(0xFF02aab0),Color(0xFF00cdac)]),

                                                    border: Border.all(
                                                      color: Color.fromRGBO(10,190,60,1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                                ),
                                                height: 140,
                                                width: 160,
                                                child: Center(
                                                    child:
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text("Foreign",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                        Text(decodedjson["data"]["regional"][index]["confirmedCasesForeign"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [Color(0xFFeb3349),Color(0xFFf45c43)]),
                                                border: Border.all(
                                                  color: Color.fromRGBO(220,28,49,1),
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            height: 140,
                                            width: 160,
                                            child: Center(
                                                child:
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Recovered",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                    Text(decodedjson["data"]["regional"][index]["discharged"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Padding(
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
                                                      colors: [Color(0xFF614385),Color(0xFF516395)]),

                                                  border: Border.all(
                                                    color: Colors.deepPurpleAccent,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                              ),
                                              height: 140,
                                              width: 160,
                                              child: Center(
                                                  child:
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Total Death",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                      Text(decodedjson["data"]["regional"][index]["deaths"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text("${dailydata[dailydata.length-1][0].toString()} Updates",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [Color(0xFFeb3349),Color(0xFFf45c43)]),
                                                border: Border.all(
                                                  color: Color.fromRGBO(220,28,49,1),
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            height: 140,
                                            width: 160,
                                            child: Center(
                                                child:
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Today +ve",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                    index+4>=12?Text(dailydata[dailydata.length-3][index+4+1].toString(),style: TextStyle(color: Colors.white,fontSize: 20),):
                                                    Text(dailydata[dailydata.length-3][index+4].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Padding(
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
                                                      colors: [Color(0xFF614385),Color(0xFF516395)]),

                                                  border: Border.all(
                                                    color: Colors.deepPurpleAccent,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                              ),
                                              height: 140,
                                              width: 160,
                                              child: Center(
                                                  child:
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Today Rcvd",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                      index+4>=12?Text(dailydata[dailydata.length-2][index+4+1].toString(),style: TextStyle(color: Colors.white,fontSize: 20),):
                                                      Text(dailydata[dailydata.length-2][index+4].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [Color(0xFFeb3349),Color(0xFFf45c43)]),
                                                border: Border.all(
                                                  color: Color.fromRGBO(220,28,49,1),
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            height: 140,
                                            width: 160,
                                            child: Center(
                                                child:
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Today Death",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                                    index+4>=12?Text(dailydata[dailydata.length-1][index+4+1].toString(),style: TextStyle(color: Colors.white,fontSize: 20),)
                                                        : Text(dailydata[dailydata.length-1][index+4].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 140,),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        }
        else{
          return Scaffold(
              appBar: AppBar(
                title: Text("Covid Cases"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitWave(color: Colors.black,size: 70,),
                    SizedBox(height: 20,),
                    Text("Loading ...",style: TextStyle(fontSize: 25),)
                  ],
                )
              )
          );
        }
      },
    );
  }
}
