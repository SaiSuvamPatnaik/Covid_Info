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
  bool pressed;
  List data =["Countries"];
  String searchoperation;
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
          print(data);
          var value = snapshot.data;
          var decodedJson = json.decode(value.body);

          void search(){
            data=[];
            for (int i=0;i<decodedJson.length;i++){
              if (searchoperation==decodedJson[i]["country"]){
                data.add(searchoperation);

              }

            }
          }
          return Scaffold(
              appBar: pressed?AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,25,0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black,)),
                      ),
                      width: 250,
                      child: TextField(
                        cursorColor: Colors.black,
                        controller: _controller,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        decoration: InputDecoration(

                          prefixIcon: IconButton(
                            icon: Icon(Icons.search,color: Colors.white,),
                            onPressed: (){
                              search();
                            },
                          ),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (text){
                          searchoperation=text;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,10,0),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){
                        setState(() {
                          if (pressed==true){
                            pressed=false;
                          }
                          else{
                            pressed=true;
                          }
                        });
                      },
                    ),
                  )
                ],
              ):AppBar(
                title: Text("Country"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      setState(() {
                        if (pressed==true){
                          pressed=false;
                        }
                        else{
                          pressed=true;
                        }
                      });
                    },
                  )
                ],
              ),
              body: data.length>1?Text(data.toString()):ListView.builder(
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
                  }));
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

  void search({String searchoperation,List decodedJson}){
    data=[];
    for (int i=0;i<decodedJson.length;i++){
      if (searchoperation==decodedJson[i]["country"]){
        setState(() {
          data.add(searchoperation);
        });


      }

    }
  }
}
