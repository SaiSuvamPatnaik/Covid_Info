import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class oxygen extends StatefulWidget {
  @override
  _oxygenState createState() => _oxygenState();
}

class _oxygenState extends State<oxygen> {
  DatabaseReference ref1 = FirebaseDatabase.instance.reference().child("Details").child("Oxygen suppliers contact");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: ref1.onValue,
          builder: (context,snap){
            if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null){
              Map data = snap.data.snapshot.value;
              List item = [];
              data.forEach((index, data) => item.add({"key": index, ...data}));
              return Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        ExpansionTile(
                          leading: CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.person,color: Colors.black,size: 20,),
                          ),
                          title: Text(item[index]["NAME"],style: TextStyle(fontSize: 20),),
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40,10,10,30),
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Phone No:",style: TextStyle(fontSize: 20,fontFamily: "Helvetica"),),
                                      SizedBox(width: 5,),
                                      Text(item[index]["Phone"],style: TextStyle(fontSize: 20,),),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Alt Phone:",style: TextStyle(fontSize: 20,fontFamily: "Helvetica"),),
                                      SizedBox(width: 5,),
                                      Text(item[index]["Alt Phone"],style: TextStyle(fontSize: 20,),),
                                    ],
                                  ),
                                  item[index]["Address"]!=""
                                      ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                13,0,0,0),
                                            child: Text(
                                              "Address:",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                100, 2, 0, 0),
                                            child: Container(
                                                width: 220,
                                                child: Text(
                                                  item[index]["Address"],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ): Text("",style: TextStyle(fontSize: 0),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(6,0,0,0),
                                            child: Text("Message:",style: TextStyle(fontSize: 20,),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(100,2,0,0),
                                            child: Container(
                                                width: 220,
                                                child: Text(item[index]["Message"],
                                                  style: TextStyle(fontSize: 20,),)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 0,),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20,left: 20),
                          child: Divider(
                            thickness: 1,
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }
            else{
              return Scaffold(
                  body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 300,
                              child: SvgPicture.asset("Assets/Images/no_data.svg")),
                          SizedBox(height: 35,),
                          Text("NO DATA FOUND",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                        ],
                      )
                  )
              );
            }
          }),
    );
  }
}
