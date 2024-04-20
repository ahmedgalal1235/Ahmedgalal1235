import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:testt/auth.dart';

class goal extends StatefulWidget {
  //const goal({super.key});
  late String email;

  goal(
    String e,
  ) {
    this.email = e;
  }

  @override
  State<goal> createState() => _goal();
}

Future adddata(BuildContext context) async {
  var url = "https://fitnessapplication111.000webhostapp.com/project/fun/goal.php";
  var response = await http.post(Uri.parse(url),
      body: {'fitness_goal': x, 'activity': x1, 'email': h});
  var data = json.decode(response.body);

  if (data == "ERROR") {
    Fluttertoast.showToast(
        msg: "nice lets go to your body..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 58, 154, 47),
        textColor: Color.fromARGB(255, 253, 251, 251),
        fontSize: 16.0);

//ghjkl
    //final route = MaterialPageRoute(builder: (context) => autlogin());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => autlogin(h)));
  } else {
    Fluttertoast.showToast(
        msg: "???????",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 86, 137, 199),
        textColor: Color.fromARGB(255, 188, 4, 4),
        webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
        fontSize: 16.0);
  }
  /* var data = json.encode(res.body);
    if (data == "done") {
      Navigator.push(cont, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("hellllllllll");
    }*/
}

late String x;
late String x1;

String? dropdown1 = null;
String? dropdown2 = null;
//df
late String h;

//dfs
class _goal extends State<goal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.topRight,
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/goal.jpeg"),
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 13, 1, 37).withOpacity(0.5),
                      BlendMode.darken),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 0,
                    child: Text(h = this.widget.email),
                    color: Color.fromARGB(0, 24, 24, 24)),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 1200,
                  height: 80,
                  child: Text(" GOALS",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 40)),
                ),

                Container(
                  height: 20,
                ),

                Container(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "your goal",
                    style: TextStyle(color: Color.fromARGB(255, 234, 232, 228)),
                  ),
                  padding: EdgeInsets.only(top: 7),
                ),
                Container(
                  height: 2,
                ),
                Container(
                    height: 25,
                    child: DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 93, 130, 101),
                      iconEnabledColor:
                          const Color.fromARGB(255, 254, 254, 254),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.grey),
                      value: dropdown1,
                      hint: Text("select"),
                      icon: const Icon(Icons.menu),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdown1 = newValue!;
                          x = newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: null,
                          child: Text('select'),
                        ),
                        DropdownMenuItem<String>(
                          value: "500",
                          child: Text('Gain Muscles'),
                        ),
                        DropdownMenuItem<String>(
                          value: '-500',
                          child: Text('Loss Fat'),
                        ),
                        DropdownMenuItem<String>(
                          value: "1",
                          child: Text('Mantain Wegight'),
                        ),
                        DropdownMenuItem<String>(
                          value: '2',
                          child: Text('Endurance'),
                        ),
                        DropdownMenuItem<String>(
                          value: '1000',
                          child: Text('Muscliar Strength'),
                        )
                      ],
                    )),

                Container(
                  height: 15,
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "your activity",
                    style: TextStyle(color: Color.fromARGB(255, 234, 232, 228)),
                  ),
                  padding: EdgeInsets.only(top: 7),
                ),
                Container(
                  height: 2,
                ),
                Container(
                    height: 25,
                    child: DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 93, 130, 101),
                      iconEnabledColor:
                          const Color.fromARGB(255, 254, 254, 254),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.grey),
                      value: dropdown2,
                      hint: Text("select"),
                      icon: const Icon(Icons.menu),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdown2 = newValue!;
                          x1 = newValue;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: null,
                          child: Text('select'),
                        ),
                        DropdownMenuItem<String>(
                          value: '1.4',
                          child: Text('train 1-3'),
                        ),
                        DropdownMenuItem<String>(
                          value: '1.5',
                          child: Text('train 3-5 '),
                        ),
                        DropdownMenuItem<String>(
                          value: '1.7',
                          child: Text('train every day '),
                        ),
                        DropdownMenuItem<String>(
                          value: '1.2',
                          child: Text('no sport/exercies'),
                        )
                      ],
                    )),
                Container(
                  height: 30,
                ),

                MaterialButton(
                  color: Color.fromARGB(255, 22, 136, 49),
                  textColor: Colors.white,
                  minWidth: 400,
                  onPressed: () {
                    adddata(context);
                    print(x);
                    print(x1);
                    print(h);
                  },
                  child: Text("Go To Next..."),
                  padding: EdgeInsets.all(20),
                  hoverColor: Color.fromARGB(255, 7, 1, 20),
                ),
                //    MaterialPageRoute(builder: (context) => ()));
              ],
            )));
  }
}
