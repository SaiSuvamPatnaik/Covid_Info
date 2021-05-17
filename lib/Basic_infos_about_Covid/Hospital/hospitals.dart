import 'dart:convert';

import 'package:covid_infos/Basic_infos_about_Covid/Hospital/Indivisualhsptls.dart';
import 'package:covid_infos/DataFetching/Contacts.dart';
import 'package:covid_infos/DataFetching/hospitalbeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
class hospital extends StatefulWidget {
  @override
  _hospitalState createState() => _hospitalState();
}

class _hospitalState extends State<hospital> {
  List circle=["https://img.icons8.com/ios/452/city.png","https://cdn0.iconfinder.com/data/icons/ecology-hazel-vol-1/256/Green-city-512.png"
    ,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcxhYXqpC9_L48TRQqcEBBZn9xrIU8Q1MrAQ&usqp=CAU",
    "https://cdn.iconscout.com/icon/free/png-256/smart-city-2641977-2189914.png",
    "https://www.pngjoy.com/pngm/129/2616373_city-icon-blockchain-for-cities-png-download.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: beds().beds1(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var value = snapshot.data;
            var decodedJson = json.decode(value.body);
            return ListView.builder(
              itemCount: decodedJson["data"]["regional"].length-1,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hospitals(decodedJson1:decodedJson["data"]["regional"][index])));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            child: Image.network(Link(index)),
                          ),
                          title: Text(decodedJson["data"]["regional"][index]["state"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total beds available: ${decodedJson["data"]["regional"][index]["totalBeds"].toString()}",style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          trailing: Container(
                            width: 90,
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: safety(decodedJson["data"]["regional"][index]["totalBeds"]),
                                ),
                                SizedBox(width: 10,),
                                Text(safety1(decodedJson["data"]["regional"][index]["totalBeds"]),style: TextStyle(fontSize: 16,fontFamily: "Sergoeui"),)
                              ],
                            ),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30,left: 70),
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
          else{
            return Scaffold(
                body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitWave(color: Colors.black,size: 70,),
                        SizedBox(height: 20,),
                        Text("Initialising...",style: TextStyle(fontSize: 25),)
                      ],
                    )));
          }
        },
      ),
    );

  }
  Color safety(int avlbl){
    if (avlbl<10000)
      return Colors.red[800];
    if (avlbl>10000 && avlbl<30000)
      return Colors.deepOrange;
    if (avlbl>30000 && avlbl<70000)
      return Colors.blue;
    if (avlbl>70000 && avlbl<100000)
      return Colors.greenAccent;

  }
  String safety1(int avlbl){
    if (avlbl<10000)
      return "Danger";
    if (avlbl>10000 && avlbl<30000)
      return "Average";
    if (avlbl>30000 && avlbl<70000)
      return "Safe";
    if (avlbl>70000 && avlbl<100000)
      return "V Safe";
  }
  String Link(int index){
    if (index%4==0){
      return circle[0];
    }
    if (index%4==1){
      return circle[1];
    }
    if (index%4==2){
      return circle[2];
    }
    if (index%4==3){
      return circle[3];
    }
  }
}
