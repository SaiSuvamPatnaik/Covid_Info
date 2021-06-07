import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class cntbnpg extends StatefulWidget {
  @override
  _cntbnpgState createState() => _cntbnpgState();
}

class _cntbnpgState extends State<cntbnpg> {
  var _currencies = [
    "Info about Plasma avlbl",
    "Oxygen suppliers contact",
    "Hospital bed info",
    "Medicine avlbl details",
  ];
  String _currentSelectedValue;
  bool showval=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,70,0,0),
                child: Text("Add yourself as a valuable Covid-19 info provider",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Kindly Fill Up This Form For Spreading Valuable Information",style: TextStyle(fontSize: 16,color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Full Name*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[400],// set border color
                      width: 1.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Phone Number*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[400],// set border color
                      width: 1.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Alt Phone Number*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[400],// set border color
                      width: 1.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Category*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,0),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                height: 60,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          style: TextStyle(fontSize: 18,color: Colors.black),
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,0,0),
                child: Text("Message*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[400],// set border color
                      width: 1.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,0,0),
                    child: Checkbox(
                      value: showval,
                      onChanged: (bool value) {
                        setState(() {
                          showval = value;
                          print(showval);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,50,0,0),
                    child: Text("I hereby agree to the Terms and Conditions of sharing this data publicly on this app in order to help the people who need it"
                      ,style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500,color: Colors.black),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
