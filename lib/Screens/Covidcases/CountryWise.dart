import 'dart:convert';
import 'package:covid_infos/DataFetching/countrywise.dart';
import 'package:covid_infos/Provider/Onsearch.dart';
import 'package:covid_infos/Screens/Covidcases/Indivisual.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {
  final fieldText = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<onsearch>(
      create: (context) => onsearch(),
      child: Builder(
        builder: (context){
          return FutureBuilder(
            future: countrywise().countries(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                var value = snapshot.data;
                List decodedJson = json.decode(value.body);
                return Consumer<onsearch>(
                  builder: (context,data,child){
                    return Scaffold(
                      appBar: data.updatesearch()?AppBar(
                        actions: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,5,0,0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.black,)),
                              ),
                              width: 250,
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: fieldText,
                                style: TextStyle(color: Colors.white,fontSize: 20),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                                  hintText: "Search...",
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              data.searchclear();
                              fieldText.clear();
                              data.offpresssearch();
                            },
                            icon: Icon(Icons.cancel,color: Colors.white,),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){
                              for (int i=0;i<decodedJson.length;i++){
                                if (fieldText.text==decodedJson[i]["country"]){
                                  data.countryfound(i);
                                }
                              };
                              if (fieldText.text.isEmpty && data.countryfound1()==-1){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a Country")));
                              }
                              if(fieldText.text.isNotEmpty && data.countryfound1()==-1){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Such Country Found . Check Spelling !!!")));
                              }
                            },
                          )
                        ],
                      ):AppBar(
                        title: Text("Countries Cases"),
                        actions: [
                          IconButton(
                              icon:Icon(Icons.search),
                              onPressed: (){
                                data.onpresssearch();
                              })
                        ],
                      ),
                      body: data.countryfound1()==-1?ListView.builder(
                          itemCount: decodedJson.length,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => indivisual(decodedjson:decodedJson,index:index)));
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(4,12,12,8),
                                  child: ListTile(
                                    leading: Hero(
                                      tag: decodedJson[index]["country"],
                                      child: ClipOval(
                                        child: Image.network(
                                          decodedJson[index]["countryInfo"]["flag"],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => indivisual(decodedjson:decodedJson,index:data.countryfound1())));
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(4,12,12,8),
                                  child: ListTile(
                                    leading: ClipOval(
                                      child: Image.network(
                                        decodedJson[data.countryfound1()]["countryInfo"]["flag"],
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(decodedJson[data.countryfound1()]["country"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                    subtitle: Row(
                                      children: [
                                        Text("Total Cases:"),
                                        Text(decodedJson[data.countryfound1()]["cases"].toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),

                    );
                  },
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
        },
      ),
    );
  }
}
