import 'package:flutter/material.dart';
class trial extends StatefulWidget {
  @override
  _trialState createState() => _trialState();
}

class _trialState extends State<trial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Wrap(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Wrap(
                children: <Widget>[
                  Icon(Icons.alarm),
                  Text('60 Minutes'),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Wrap(
                children: <Widget>[
                  Icon(Icons.shop),
                  Text('Loremibbhjvsfhhhjhldfbhjslfgbhblhbpsumssssssssssssssssssssssssssssssss'),
                ],
              ),
            ),
          ],
        ),
          ],
        ),
    ));
  }
}
