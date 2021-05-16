import 'dart:convert';

import 'package:covid_infos/DataFetching/Contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
class contacts extends StatefulWidget {
  @override
  _contactsState createState() => _contactsState();
}

class _contactsState extends State<contacts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: contactsno().contactno(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var value = snapshot.data;
            var decodedJson = json.decode(value.body);
            print(decodedJson["data"]["contacts"]["regional"].length);
            return ListView.builder(
              itemCount: decodedJson["data"]["contacts"]["regional"].length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    _makePhoneCall("tel:"+"${decodedJson["data"]["contacts"]["regional"][index]["number"].toString()}");
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Google_Contacts_icon.svg/1200px-Google_Contacts_icon.svg.png"),
                          ),
                          title: Text(decodedJson["data"]["contacts"]["regional"][index]["loc"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(decodedJson["data"]["contacts"]["regional"][index]["number"].toString(),style: TextStyle(fontSize: 15),),
                            ],
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
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
