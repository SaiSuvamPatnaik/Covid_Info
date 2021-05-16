import 'dart:convert';
import 'package:covid_infos/ConvertDate/Conversion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class totalsample extends StatefulWidget {
  @override
  _totalsampleState createState() => _totalsampleState();
}

class _totalsampleState extends State<totalsample> {
  DateTime _selectedDate;
  String date1;
  int c,d=0,index,difference;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get("https://api.rootnet.in/covid19-in/stats/testing/history"),
      builder: (context,snapshot){
        if (snapshot.hasData){
          var value = snapshot.data;
          var decodedJson = json.decode(value.body);

          return Scaffold(
            appBar: AppBar(
              title: Text("Samples Tested"),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(0,230,0,0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,5,50,5),
                    child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today,size: 25,),
                          onPressed: (){
                            _selectDate(context);
                          },
                        ),
                        labelText: ("Enter Date"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person,size: 30,color: Colors.blueAccent,),
                        filled: true,
                      ),
                      controller: _textEditingController,style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        elevation: 5,
                        onPressed: (){
                          c=0;
                          String date=_textEditingController.text.replaceAll(" ","");
                          String date1 = date.replaceAll(",","");
                          List monthsinwords=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
                          for (int j = 0; j < decodedJson["data"].length; j++) {
                            String convert = converteddate(monthsinwords,decodedJson,j);
                            if (date1==convert) {
                              setState(() {
                                c=1;
                                index=j;
                              });
                            }
                            else{
                              d++;
                            }
                          };
                          if(index==0){
                            difference= decodedJson["data"][index]["totalSamplesTested"];
                          }
                          else{
                            difference = decodedJson["data"][index]["totalSamplesTested"]-decodedJson["data"][index-1]["totalSamplesTested"];
                          }
                          print(difference);
                        },
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                            child: Text("CLICK",style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  c==1?Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,0,8),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                              height: 140,
                              width: 180,
                              decoration: BoxDecoration(
                              gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFeb3349),Color(0xFFf45c43)]),
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          child: Center(
                            child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Total Tested",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                  Text(decodedJson["data"][index]["totalSamplesTested"].toString(),style: TextStyle(color: Colors.white,fontSize: 23),),
                                ],
                              )),
                            ),
                          ),
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          height: 140,
                          width: 180,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFF614385),Color(0xFF516395)]),
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Center(
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Today Tested",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                                  Text(difference.toString(),style: TextStyle(color: Colors.white,fontSize: 23),),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ) :
                  Text("")
                ],
              ),
            ),
          );
        }
        else{
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        }
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}