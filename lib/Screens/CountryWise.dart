import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {
  final fieldText = TextEditingController();
  bool pressed;
  List data=[];
  List data1=[];
  TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pressed=false;
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future: http.get("https://corona.lmao.ninja/v2/countries?yesterday&sort"),
      builder: (context,snapshot){

        if(snapshot.hasData){

          var value = snapshot.data;
          var decodedJson = json.decode(value.body);
          return Scaffold(
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black,)),
                      ),
                      width: 300,
                      child: TextField(
                        cursorColor: Colors.black,
                        controller: fieldText,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.white,),
                          suffixIcon: IconButton(
                            onPressed: (){
                              data.removeAt(0);
                              data1.removeAt(0);
                              setState(() {
                                fieldText.clear();
                              });

                            },
                            icon: Icon(Icons.cancel,color: Colors.white,),
                          ),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      data=[];
                      data1=[];
                      for (int i=0;i<decodedJson.length;i++){
                        if (fieldText.text==decodedJson[i]["country"]){
                          setState(() {
                            data.insert(0,fieldText.text);
                            data1.insert(0,decodedJson[i]["cases"].toString());
                          });
                        }
                      }
                    },
                  )
                ],
              ),
              body: data.isEmpty?ListView.builder(
                  itemCount: decodedJson.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        print(decodedJson[index]["cases"]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4,12,12,8),
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.network(
                                decodedJson[index]["countryInfo"]["flag"],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(decodedJson[index]["country"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            subtitle: Row(
                              children: [
                                Text("Total Cases:"),
                                Text(decodedJson[index]["cases"].toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  :ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        print(decodedJson[index]["cases"]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4,12,12,8),
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.network(
                                decodedJson[index]["countryInfo"]["flag"],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(data[0],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                            subtitle: Row(
                              children: [
                                Text("Total Cases:"),
                                Text(data1[0].toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),


          );
        }
        else{
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCube(color: Colors.black,size: 70,),
                SizedBox(height: 50,),
                Text("Please Wait ...",style: TextStyle(fontSize: 26,color: Colors.red,fontWeight: FontWeight.bold),)
              ],
            ),
          );
        }

      },
    );
  }
}
