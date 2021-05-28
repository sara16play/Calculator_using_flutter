import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myconvert extends StatefulWidget {
  Myconvert({Key key}) : super(key: key);

  @override
  _MyconvertState createState() => _MyconvertState();
}

class _MyconvertState extends State<Myconvert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Convertor", style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.swipe,
            color: Colors.red,
            size: 25,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.calculate_outlined, color: Colors.red),
                onPressed: () async {
                  Navigator.pushNamed(context, "calculator");
                }),
            IconButton(
                icon: Icon(Icons.science, color: Colors.red),
                onPressed: () async {
                  Navigator.pushNamed(context, "scientific");
                }),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //color: Colors.green,
                //padding: EdgeInsets.only(right: 7),
                alignment: Alignment.center,
                child: Text(
                  "to be updated soon...",
                  //equation,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]));
  }
}
