import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:testt/mandata.dart';

class autlogin extends StatefulWidget {
  late String email;

  autlogin(
    String e,
  ) {
    this.email = e;
  }

  @override
  State<autlogin> createState() => _autloginState();
}

late String h;

//10.0.2.2
class _autloginState extends State<autlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 1, 18).withOpacity(1),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Container(
              margin: EdgeInsets.only(left: 100),
              alignment: Alignment.topLeft,
              child: Text("  Fitness",
                  style: TextStyle(
                      color: const Color.fromARGB(205, 255, 255, 255),
                      fontSize: 28)),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text("App",
                  style: TextStyle(
                      color: Color.fromARGB(205, 41, 176, 48), fontSize: 28)),
            ),
          ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/about you.jpeg"),
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 13, 1, 37).withOpacity(0.5),
                      BlendMode.darken),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(h = this.widget.email),
                  height: 0,
                ),Container(height: 100,),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 85,
                  child: Text(" About You",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 40)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: Text(
                      "we want to know more about you, folloe the staps to complete the information",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 10)),
                ),
                Container(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("lib/img/scan.jpeg",
                          width: 100, height: 50),
                      height: 70,
                      width: 120,
                      color: Color.fromARGB(255, 7, 1, 28),
                    ),
                    Container(
                      /* alignment: Alignment.center,
                        height: 170,
                        width: 220,
                      color:Color.fromARGB(255, 19, 8, 43),*/
                      width: 5,
                      color: Color.fromARGB(255, 19, 8, 43),
                    ),
                    Container(
                      child: Image.asset("lib/img/write.jpeg",
                          width: 100, height: 50),
                      height: 70,
                      width: 120,
                      color: Color.fromARGB(255, 7, 1, 28),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      MaterialButton(
                        color: Color.fromARGB(255, 19, 8, 43),
                        textColor: Color.fromARGB(255, 22, 136, 49),
                        minWidth: 80,
                        onPressed: () {},
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 22, 136, 49)),
                        ),
                        child: Text("Scan"),
                        padding: EdgeInsets.all(2),
                      ),
                      Container(
                        /* alignment: Alignment.center,
                        height: 170,
                        width: 220,
                      color:Color.fromARGB(255, 19, 8, 43),*/
                        width: 34,
                        color: Color.fromARGB(255, 19, 8, 43),
                      ),
                      MaterialButton(
                        color: Color.fromARGB(255, 19, 8, 43),
                        textColor: Color.fromARGB(255, 22, 136, 49),
                        minWidth: 80,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mandata(h)));
                        },
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 22, 136, 49)),
                        ),
                        child: Text("Write"),
                        padding: EdgeInsets.all(2),
                      ),
                    ])
                  ],
                ),
              ],
            )));
  }
}
