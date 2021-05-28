import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

class Myscientific extends StatefulWidget {
  Myscientific({Key key}) : super(key: key);

  @override
  _MyscientificState createState() => _MyscientificState();
}

class _MyscientificState extends State<Myscientific> {
  @override
  double fact = 1;
  double equationFontSize = 50.0;
  String history = "";
  String result = "";
  String output = "";
  String otp;
  double fnum = 0, snum = 0;
  double resultFontSize = 30.0;
  facto(double fnum) {
    if (fnum < 0)
      print("Error! Factorial of a negative number doesn't exist.");
    else {
      for (int i = 1; i <= fnum; ++i) {
        fact *= i;
      }
      return fact;
    }
  }

  buttonPressed(String btnval) {
    print(btnval);
    print(btnval);
    if (btnval == "C") {
      equationFontSize = 30.0;
      resultFontSize = 50.0;
      otp = "";
      output = "";
      history = "";
      fnum = 0;
      snum = 0;
      fact = 1;
    } else if (btnval == ".") {
      if (output.contains(".")) {
        print("already present .");
        return;
      } else {
        output = output + btnval;
      }
    } else if (btnval == "<") {
      equationFontSize = 50.0;
      resultFontSize = 30.0;
      output = output.substring(0, output.length - 1);
      if (output == "") {
        output = "0";
      }
    } else if (btnval == "x^2" ||
        btnval == "x^3" ||
        btnval == "log" ||
        btnval == "sin" ||
        btnval == "cos" ||
        btnval == "tan" ||
        btnval == "sqrt" ||
        btnval == "x^y" ||
        btnval == "x!") {
      equationFontSize = 50.0;
      resultFontSize = 30.0;
      fnum = double.parse(result);
      if (btnval == "x^2") {
        history = (" $fnum ^ 2").toString();
        output = (fnum * fnum).toStringAsFixed(2);
      } else if (btnval == "x^3") {
        history = (" $fnum ^ 3").toString();
        output = (fnum * fnum * fnum).toStringAsFixed(2);
      } else if (btnval == "log") {
        history = ("log($fnum)").toString();
        output = (log(fnum) / 2.302585092994046).toStringAsFixed(2);
      } else if (btnval == "tan") {
        history = ("tan($fnum)").toString();
        double e = 180 / pi;
        output = (tan(fnum)).toStringAsFixed(2);
      } else if (btnval == "sin") {
        history = ("sin($fnum)").toString();
        double e = 180 / pi;
        output = (sin(fnum)).toStringAsFixed(2);
      } else if (btnval == "cos") {
        history = ("cos($fnum)").toString();
        double e = 180 / pi;
        output = (cos(fnum)).toStringAsFixed(2);
      } else if (btnval == "sqrt") {
        history = ("sqrt($fnum)").toString();
        output = sqrt(fnum).toStringAsFixed(2);
      } else if (btnval == "x!") {
        history = ("$fnum!").toString();
        output = facto(fnum).toStringAsFixed(2);
      } else {
        otp = btnval;
        output = "";
      }
    } else if (btnval == "=") {
      equationFontSize = 50.0;
      resultFontSize = 30.0;
      snum = double.parse(result);

      if (otp == "x^y") {
        history = fnum.toString() + "^" + snum.toString();

        output = pow(fnum, snum).toStringAsFixed(2);
      }

      fnum = 0;
      snum = 0;
    } else {
      output = output + btnval;
    }
    print(output);
    setState(() {
      equationFontSize = 30.0;
      resultFontSize = 50.0;
      result = output;
    });
  }

  Widget button(
      String btnval, Color btnbor, Color valcol, Color btncol, double fsize) {
    return Expanded(
        child: MaterialButton(
      onPressed: () => buttonPressed(btnval),
      color: btncol,
      elevation: 10,
      padding: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: btnbor, width: 2),
      ),
      child: Text(
        btnval,
        style: TextStyle(color: valcol, fontSize: fsize),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scientific", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.science,
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
              icon: Icon(Icons.swipe, color: Colors.red),
              onPressed: () async {
                Navigator.pushNamed(context, "convert");
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            //color: Colors.green,
            padding: EdgeInsets.only(right: 7),
            alignment: Alignment.bottomRight,
            child: Text(
              history,
              //equation,
              style: TextStyle(
                  fontSize: equationFontSize, color: Colors.grey[900]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(right: 7),
            alignment: Alignment.bottomRight,
            //color: Colors.grey,
            child: Text(
              result,
              style: TextStyle(
                  fontSize: resultFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button(
                  "C", Colors.black, Colors.white, Colors.redAccent[700], 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "<", Colors.black, Colors.white, Colors.redAccent[700], 45),
              SizedBox(
                width: 5,
              ),
              // button("x^y", Colors.amberAccent, Colors.white, Colors.green[900],
              //     30),
              // SizedBox(
              //   width: 5,
              // ),
              button(
                  "x!", Colors.amberAccent, Colors.white, Colors.blue[900], 30),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button("sqrt", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
              button("x^y", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
              button("x^2", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
              button("x^3", Colors.amberAccent, Colors.white, Colors.blue[900],
                  25),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button(
                  "7", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "8", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "9", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button("log", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button(
                  "4", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "5", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "6", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button("sin", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button(
                  "1", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "2", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "3", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button("cos", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              button(
                  ".", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button(
                  "0", Colors.redAccent[700], Colors.white, Colors.black, 45),
              SizedBox(
                width: 5,
              ),
              button("=", Colors.redAccent[700], Colors.white,
                  Colors.green[700], 45),
              SizedBox(
                width: 5,
              ),
              button("tan", Colors.amberAccent, Colors.white, Colors.blue[900],
                  30),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
