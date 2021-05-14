import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class indivisual extends StatefulWidget {
  List decodedjson;
  int index;
  indivisual({this.decodedjson,this.index});
  @override
  _indivisualState createState() => _indivisualState(decodedjson:decodedjson,index:index);
}

class _indivisualState extends State<indivisual> {
  List decodedjson;
  int index;
  _indivisualState({this.decodedjson,this.index});
  @override
  Widget build(BuildContext context) {
    double percentage = (decodedjson[index]["cases"])/(decodedjson[index]["population"])*10;
    int a = (percentage*100).toInt();
    double b = a/100;
    print(decodedjson[index]);
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30,0,0),
              child: Image.network(decodedjson[index]["countryInfo"]["flag"],scale: 2,),
            ),
            SizedBox(height: 20,),
            decodedjson[index]["country"].length>16?Text(decodedjson[index]["country"],style: TextStyle(fontSize:30,color: Colors.black,fontWeight: FontWeight.w600),)
            :Text(decodedjson[index]["country"],style: TextStyle(fontSize:40,color: Colors.black,fontWeight: FontWeight.w600),),
            Padding(
              padding: EdgeInsets.fromLTRB(0,20,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: Border.all(
                          color: Colors.blueAccent,
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
                              Text("Total Cases",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                              Text(decodedjson[index]["cases"].toString(),style: TextStyle(color: Colors.white,fontSize: 23),),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,2,2,2),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(10,190,60,1),
                            border: Border.all(
                              color: Color.fromRGBO(10,190,60,1),
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
                                Text("Recovered",style: TextStyle(color: Colors.white,fontSize: 25),),
                                Text(decodedjson[index]["recovered"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            CircularPercentIndicator(
              radius: 130.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: b>1.0?b/10:b,
              center: b>1.0?Text(
                (b/10).toString()+"%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ):Text(
                "$b%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: new Text(
                  "Approx Affection With Covid",
                  style:
                  new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.orange,
              progressColor: Colors.red[700],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(220,28,49,1),
                        border: Border.all(
                          color: Color.fromRGBO(220,28,49,1),
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
                            Text("Total Death",style: TextStyle(color: Colors.white,fontSize: 25),),
                            Text(decodedjson[index]["deaths"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,2,2,2),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
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
                              Text("Active Cases",style: TextStyle(color: Colors.white,fontSize: 25),),
                              Text(decodedjson[index]["active"].toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
