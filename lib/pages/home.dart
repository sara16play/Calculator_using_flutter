import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  Myhome({Key key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          "SaraPlay",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        leading: Icon(
          Icons.home,
          color: Colors.red,
          size: 25,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(32),
              elevation: 10,
              child: MaterialButton(
                minWidth: 300,
                onPressed: () {
                  Navigator.pushNamed(context, "calculator");
                },
                child: Text("Math Calculator",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22)),
              ),
            ),
            SizedBox(height: 35),
            Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 300,
                  onPressed: () {
                    Navigator.pushNamed(context, "scientific");
                  },
                  child: Text("Scientific Calculator",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 22)),
                )),
            SizedBox(height: 35),
            Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 300,
                  onPressed: () {
                    Navigator.pushNamed(context, "convert");
                  },
                  child: Text("Unit Convertor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 22)),
                )),
          ],
        ),
      ),
    );
  }
}
