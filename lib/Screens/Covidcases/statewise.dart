import 'dart:async';
import 'dart:convert';
import 'package:covid_infos/DataFetching/Statedatas.dart';
import 'package:covid_infos/Screens/Covidcases/Indivisual_State.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class statewise extends StatefulWidget {
  @override
  _statewiseState createState() => _statewiseState();
}

class _statewiseState extends State<statewise> {
  List _data = [],logo;
  int trialdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCSV();
  }
  void loadCSV() async {
    final _rawData = await rootBundle.loadString("Assets/CSV/state_wise_daily.csv");
    List _listData = CsvToListConverter().convert(_rawData);
    setState((){
      for (int i=0;i<_listData.length;i++){
        _data.add(_listData[i]);
      }
    });
  }

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
                leading: Icon(Icons.arrow_back,size: 30,color: Colors.black,),
                backgroundColor: Colors.white,
                elevation: 3,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  child: Text("Statewise Covid Cases",style: GoogleFonts.pacifico(
                    textStyle: TextStyle(color: Colors.brown,fontSize: 25,),
                  ),),
                ),),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: ListView.builder(
                  itemCount: datas1.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,3,8,3),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 22,
                                child: Text(datas1[index],),
                              ),
                              title: Text(datas2[index],style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.black,fontSize: 18),
                              ),),
                              trailing: IconButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => indivisualstate(index:index,logo:datas1,dailydata:_data)));
                                    },
                                icon: Icon(Icons.info_outline,color: Colors.black,size: 27,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                            child: Divider(
                              thickness: 1,
                            ),
                          )
                        ],
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
