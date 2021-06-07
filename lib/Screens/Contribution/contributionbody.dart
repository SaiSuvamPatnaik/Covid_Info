import 'package:covid_infos/Screens/Contribution/contributionpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class contributionbody extends StatefulWidget {
  @override
  _contributionbodyState createState() => _contributionbodyState();
}

class _contributionbodyState extends State<contributionbody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0,50,0,0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(80,0,0,0),
              child: Text("HELP ALL",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(170,0,0,0),
              child: Text("SAVE ALL",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15,),
            Container(
              height: MediaQuery.of(context).size.height-150,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 300,
                          child: SvgPicture.asset("Assets/Images/mask-man.svg"))),
                  SingleChildScrollView(
                    child: Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,20,0,0),
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                        border: Border.all(
                                          color: Colors.black
                                          ,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    height: 140,
                                    width: 180,
                                    child: Center(
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                              child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                              child: Text("Plasma",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                            ),                                    ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                      border: Border.all(
                                        color: Colors.black
                                        ,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Text("Hospital",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),                                    ],
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => statewise()));
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                      border: Border.all(
                                        color: Colors.black
                                        ,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Text("Oxygen",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),                                    ],
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => statewise()));
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                      border: Border.all(
                                        color: Colors.black
                                        ,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Text("Medicine",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),                                    ],
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => cntbnpg()));
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                          colors: [Color(0xFF06beb6),Color(0xFF48b1bf)]),
                                      border: Border.all(
                                        color: Colors.black
                                        ,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 140,
                                  width: 180,
                                  child: Center(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            child: Icon(Icons.phone_android,size: 30,color: Colors.white,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Text("Contribute",style: TextStyle(fontFamily: "Helvetica",color: Colors.white,fontSize: 25),),
                                          ),                                    ],
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,)
                          ],
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
