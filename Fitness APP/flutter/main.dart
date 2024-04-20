import 'package:flutter/material.dart';
import 'package:testt/login.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //  child: Image.asset("lib/img/logo.jpeg"),
            //width: 60,
            //height: 60,

            Column(
              
              children: [
                Container(
                  child: Image.asset("lib/img/logo.jpeg"),
                  width: 60,
                  height: 60,
                )
              ],
            ),

            Container(
              child: Text("  Fitness",
                  style: TextStyle(
                      color: const Color.fromARGB(205, 255, 255, 255),
                      fontSize: 28)),
            ),
            Container(
              child: Text(" App",
                  style: TextStyle(
                      color: Color.fromARGB(205, 41, 176, 48), fontSize: 28)),
            ),
          ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/welcome.jpeg"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 19, 20, 41).withOpacity(0.88),
                    BlendMode.darken),
                filterQuality: FilterQuality.high,
              ),
            ),
            //child: Center(
            //      child: Text(
            //      "Fitness Application",
            //  style: TextStyle(color: const Color.fromARGB(205, 255, 255, 255), fontSize: 50),
            //)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 50),
                  margin: EdgeInsets.only(top: 100),
                  width: 1200,
                  height: 58,
                  child: Text("  Welcome",
                      style: TextStyle(
                          color: const Color.fromARGB(205, 255, 255, 255),
                          fontSize: 30)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 170),
                  width: 200,
                  height: 100,
                  child: Text(
                      " practice and live the new experiance of exercising at any time.",
                      style: TextStyle(
                          color: Color.fromARGB(205, 222, 230, 223),
                          fontSize: 12)),
                ),Container(height:20),
                MaterialButton(
                  color: Color.fromARGB(255, 22, 136, 49),
                  textColor: Colors.white,
                  minWidth: 400,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  shape: StadiumBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 22, 136, 49), width: 2)),
                  child: Text("Try Now"),
                  padding: EdgeInsets.all(25),
                )
              ],
            )));
  }
}

