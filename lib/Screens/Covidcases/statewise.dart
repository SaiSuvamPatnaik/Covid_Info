import 'dart:convert';
import 'package:covid_infos/DataFetching/Statedatas.dart';
import 'package:covid_infos/Screens/Covidcases/Indivisual_State.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class statewise extends StatefulWidget {
  @override
  _statewiseState createState() => _statewiseState();
}

class _statewiseState extends State<statewise> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: statedata().states(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var value = snapshot.data;
            var decodedJson = json.decode(value.body);
            final data = decodedJson as Map;
            List datas1=[];
            List datas2=[];
            for (var i in data.keys){
              datas1.add(i);
            }
            datas1.removeAt(8);  // Removed Daman and Diu as its datas were not present in the API.
            for (var j in data.values){
              datas2.add(j);
            }
            datas2.removeAt(8); // Removed Daman and Diu as its datas were not present in the API.
            return Scaffold(
              appBar: AppBar(
                title: Text("Statewise Covid Cases"),),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: ListView.builder(
                  itemCount: datas1.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,10,5),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              child: Text(datas1[index]),
                            ),
                            title: Text(datas2[index]),
                            trailing: IconButton(
                              onPressed: (){
                                String logo;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => indivisualstate(index:index,logo:datas1[index])));
                              },
                              icon: Icon(Icons.info_outline,color: Colors.black,size: 30,),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          else{
            return Scaffold(
              appBar: AppBar(
                title: Text("Statewise Covid Cases"),),
              body: Center(child: SpinKitCircle(color: Colors.black,size: 100,),),
            );
          }
        });
  }
}
