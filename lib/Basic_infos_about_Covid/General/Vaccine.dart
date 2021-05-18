import 'dart:convert';
import 'package:covid_infos/Basic_infos_about_Covid/General/Dateslot.dart';
import 'package:covid_infos/ConvertDate/Conversion.dart';
import 'package:covid_infos/Provider/Onsearch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class vaccine extends StatefulWidget {
  @override
  _vaccineState createState() => _vaccineState();
}

class _vaccineState extends State<vaccine> {
  DateTime _selectedDate;
  String date1,city;
  int difference;
  bool pressed;
  var infos;
  Future getData(String finaldate, String city) async{
    String myUrl="https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=${city}&date=${finaldate}";
    var req = await http.get(myUrl);
    setState(() {
      infos = json.decode(req.body);
    });
  }
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pressed=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50,15,50,5),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50,25,50,5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: ("Enter Pincode"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city,size: 30,color: Colors.blueAccent,),
                  filled: true,
                ),
                onChanged: (text){
                  setState(() {
                    city=text;
                  });
                },
                controller: _textEditingController1,style: TextStyle(fontSize: 20),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,10,0,0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  elevation: 5,
                  onPressed: (){
                    String date=_textEditingController.text.replaceAll(" ","");
                    String date1 = date.replaceAll(",","");
                    String converteddate = Converteddata1(date1);
                    getData(converteddate,city);
                    setState(() {
                      pressed=true;
                    });
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
            SizedBox(height: 10,),
            pressed?Container(
              height: 300,
              child: ListView.builder(
                  itemCount: infos["centers"].length,
                  itemBuilder: (context,index){
                    return Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Map slot = infos["centers"][index] as Map;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => dateslot(slot:slot)));
                              },
                              child: Container(
                                height: 60,
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://media.istockphoto.com/photos/long-and-dark-hospital-hallway-picture-id108162808?k=6&m=108162808&s=170667a&w=0&h=Fp2DJR6bG6-6oz4LHi09VQaL77_Ys0syNv2fD-Tcixs=",
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: Text(infos["centers"][index]["name"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

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
                  }),
                )
                :Text(""),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30,0,0),
              child: Text("Get Vaccinated",style: TextStyle(fontSize: 35,fontFamily: "SurfingCapital",color: Colors.purple,fontWeight: FontWeight.w600,letterSpacing: 1),),
            ),
          ],
        ),
      ),
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