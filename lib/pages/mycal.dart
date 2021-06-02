import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Mycal extends StatefulWidget {
  Mycal({Key key}) : super(key: key);

  @override
  _MycalState createState() => _MycalState();
}

class _MycalState extends State<Mycal> {
  var currentFocus;

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  //String equation = "";
  double equationFontSize = 50.0;
  String history = "";
  String result = "";
  String output = "";
  String otp;
  double fnum = 0, snum = 0;
  double resultFontSize = 30.0;
  buttonPressed(String btnval) {
    print(btnval);
    if (btnval == "C") {
      equationFontSize = 30.0;
      resultFontSize = 50.0;
      otp = "";
      output = "";
      history = "";
      fnum = 0;
      snum = 0;
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
        output = "";
      }
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "×" ||
        btnval == "÷" ||
        btnval == "%") {
      equationFontSize = 50.0;
      resultFontSize = 30.0;
      fnum = double.parse(result);
      otp = btnval;
      output = "";
    } else if (btnval == "=") {
      equationFontSize = 50.0;
      resultFontSize = 30.0;
      snum = double.parse(result);
      if (otp == "+") {
        output = (fnum + snum).toStringAsFixed(2);

        history = fnum.toString() + otp.toString() + snum.toString();
      }
      if (otp == "-") {
        output = (fnum - snum).toStringAsFixed(2);

        history = fnum.toString() + otp.toString() + snum.toString();
      }

      if (otp == "×") {
        output = (fnum * snum).toStringAsFixed(2);

        history = fnum.toString() + otp.toString() + snum.toString();
      }
      if (otp == "÷") {
        output = (fnum / snum).toStringAsFixed(2);

        history = fnum.toString() + otp.toString() + snum.toString();
      }
      if (otp == "%") {
        output = ((fnum * snum) / 100).toStringAsFixed(2);

        history = fnum.toString() + otp.toString() + snum.toString();
      }
      fnum = 0;
      snum = 0;
      //otp = "";
    } else {
      //history = fnum.toString() + otp.toString() + snum.toString();

      output = output + btnval;
    }
    print(output);
    setState(() {
      equationFontSize = 30.0;
      resultFontSize = 50.0;
      result = output;
    });
  }

  // String equation = "";
  // double equationFontSize = 30.0;
  // String expression = "";
  // String result = "";
  // double resultFontSize = 50.0;

  // buttonPressed(String buttonText) {
  //   setState(() {
  //     if (buttonText == "C") {
  //       equation = "";
  //       result = "";
  //       equationFontSize = 30.0;
  //       resultFontSize = 50.0;
  //     } else if (buttonText == ".") {
  //       if (equation.contains(".")) {
  //         print("already present .");
  //         return;
  //       } else {
  //         equation = equation + buttonText;
  //       }
  //     } else if (buttonText == "<") {
  //       equationFontSize = 50.0;
  //       resultFontSize = 30.0;
  //       equation = equation.substring(0, equation.length - 1);
  //       if (equation == "") {
  //         equation = "0";
  //       }
  //     } else if (buttonText == "=") {
  //       equationFontSize = 30.0;
  //       resultFontSize = 50.0;

  //       expression = equation;
  //       expression = expression.replaceAll('×', '*');
  //       expression = expression.replaceAll('÷', '/');

  //       try {
  //         Parser p = Parser();
  //         Expression exp = p.parse(expression);

  //         ContextModel cm = ContextModel();
  //         result = '${exp.evaluate(EvaluationType.REAL, cm)}';
  //       } catch (e) {
  //         result = "Error";
  //       }
  //     } else {
  //       equationFontSize = 50.0;
  //       resultFontSize = 30.0;
  //       if (equation == "0") {
  //         equation = buttonText;
  //       } else {
  //         equation = equation + buttonText;
  //       }
  //     }
  //   });
  // }

  Widget button(String btnval, Color btnbor, Color valcol, Color btncol) {
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
        style: TextStyle(color: valcol, fontSize: 45),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculator", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.calculate_outlined,
          color: Colors.red,
          size: 25,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.science_outlined, color: Colors.red),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, "scientific");
              }),
          IconButton(
              icon: Icon(Icons.swipe, color: Colors.red),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, "convert");
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
              button("C", Colors.black, Colors.white, Colors.redAccent[700]),
              SizedBox(
                width: 5,
              ),
              button("<", Colors.black, Colors.white, Colors.redAccent[700]),
              SizedBox(
                width: 5,
              ),
              button("%", Colors.amberAccent, Colors.white, Colors.blue[900]),
              SizedBox(
                width: 5,
              ),
              button("÷", Colors.amberAccent, Colors.white, Colors.blue[900]),
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
              button("7", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("8", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("9", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("×", Colors.amberAccent, Colors.white, Colors.blue[900]),
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
              button("4", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("5", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("6", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("-", Colors.amberAccent, Colors.white, Colors.blue[900]),
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
              button("1", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("2", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("3", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("+", Colors.amberAccent, Colors.white, Colors.blue[900]),
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
              button("00", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("0", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button(".", Colors.redAccent[700], Colors.white, Colors.black),
              SizedBox(
                width: 5,
              ),
              button("=", Colors.amberAccent, Colors.white, Colors.green[700]),
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
