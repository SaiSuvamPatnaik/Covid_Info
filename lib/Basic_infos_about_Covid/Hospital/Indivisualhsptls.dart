import 'package:flutter/material.dart';
class hospitals extends StatefulWidget {
  var decodedJson1;
  hospitals({this.decodedJson1});
  @override
  _hospitalsState createState() => _hospitalsState(decodedJson1:decodedJson1);
}

class _hospitalsState extends State<hospitals> {
  var decodedJson1;
  _hospitalsState({this.decodedJson1});
  @override
  Widget build(BuildContext context) {
    print(decodedJson1);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              decodedJson1["state"].length<16 ?
                Text(decodedJson1["state"]
                  ,style: TextStyle(fontSize: 40,fontFamily: "SurfingCapital",color: Colors.blue,fontWeight: FontWeight.w600,letterSpacing: 2),)
                    :decodedJson1["state"].length>20?
                      Center(child: Text(decodedJson1["state"]
                      ,style: TextStyle(fontSize: 25,fontFamily: "SurfingCapital",color: Colors.blue,fontWeight: FontWeight.w600,letterSpacing: 1),))
                        :Text(decodedJson1["state"]
                          ,style: TextStyle(fontSize: 35,fontFamily: "SurfingCapital",color: Colors.blue,fontWeight: FontWeight.w600,letterSpacing: 1),),
              SizedBox(height: 40,),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text("Rural Hospitals:",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0,3,10,0),
                  child: Text("${decodedJson1["ruralHospitals"]}",style: TextStyle(fontSize:30,fontFamily: "Helvetica"),),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text("Rural Beds:",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0,3,10,0),
                  child: Text("${decodedJson1["ruralBeds"]}",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text("Urban Hospitals:",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0,3,10,0),
                  child: Text("${decodedJson1["urbanHospitals"]}",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text("Urban Beds:",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0,3,10,0),
                  child: Text("${decodedJson1["urbanBeds"]}",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                  child: Text("Total Hospitals:",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0,3,10,0),
                  child: Text("${decodedJson1["totalHospitals"]}",style: TextStyle(fontSize: 30,fontFamily: "Helvetica"),),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
