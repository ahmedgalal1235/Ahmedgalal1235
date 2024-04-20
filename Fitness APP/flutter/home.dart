import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:intl/intl.dart';
import 'package:testt/auth.dart';
import 'package:testt/day1.dart';
import 'package:testt/day2.dart';
import 'package:testt/day3.dart';
import 'package:testt/day4.dart';
import 'package:testt/day5.dart';
import 'package:testt/login.dart';
import 'package:testt/mandata.dart';
import 'package:testt/w_plan1.dart';

void main() async {
  WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class home extends StatefulWidget {
  late String email;

  home(
    String e,
  ) {
    this.email = e;
  }

  @override
  State<home> createState() => _home();
}

late String h;

class _home extends State<home> {
  int selectedindex = 0;
  List<Widget> widgetpages = [pageone(), pagetwo(), pagethere(), pagefour()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        selectedItemColor: Color.fromARGB(205, 41, 176, 48),
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Color.fromARGB(251, 34, 30, 30)),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              label: 'workout',
              backgroundColor: Color.fromARGB(251, 34, 30, 30)),
          BottomNavigationBarItem(
              icon: Icon(Icons.dining_sharp),
              label: 'foods',
              backgroundColor: Color.fromARGB(251, 34, 30, 30)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'account',
              backgroundColor: Color.fromARGB(251, 34, 30, 30))
        ],
        backgroundColor: Color.fromARGB(255, 37, 36, 38),
      ),

      backgroundColor: Color.fromARGB(227, 17, 13, 30),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Container(
            //margin: EdgeInsets.only(left: 200),
            alignment: Alignment.topLeft,
            child: Text("  Fitness",
                style: TextStyle(
                    color: Color.fromARGB(205, 41, 176, 48), fontSize: 28)),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("App",
                style: TextStyle(
                    color: const Color.fromARGB(205, 255, 255, 255),
                    fontSize: 28)),
          ),
          Container(
            width: 0,
            child: Text(h = this.widget.email),
          ),
          Container()
        ]),
        backgroundColor: Color.fromARGB(255, 37, 36, 38),
        elevation: 0,
      ),
      body: Container(
        child: widgetpages.elementAt(selectedindex),
      ),
      //    MaterialPageRoute(builder: (context) => ()));
    );
  }
}

class pageone extends StatefulWidget {
  @override
  State<pageone> createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  List list = [];

  Future getdata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/meal_p.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': home(h).email,
    });
    if (response.statusCode == 200) {
      setState(() {
        list = json.decode(response.body);
      });
    }
  }

  usererr() {
    ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
          body: Center(
            child: Text("waiting",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Colors.transparent,
        );
  }

  @override
  void initState() {
    super.initState();
    getdata();
    usererr();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 120,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text("Your Activity",
                  style: TextStyle(
                      color: const Color.fromARGB(205, 255, 255, 255),
                      fontSize: 28))),
          Container(
            height: 220,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(245, 42, 89, 48))),
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text("Today Activity",
                  style: TextStyle(
                      color: const Color.fromARGB(205, 255, 255, 255),
                      fontSize: 28))),
          Container(
            child: Row(
              children: [
                Container(
                  width: 10,
                ),
                Container(
                  height: 112,
                  width: 82,
                  child: Image.asset(
                    "lib/img/walk.jpeg",
                    height: 100,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 45, 154, 60)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                Container(
                  width: 15,
                ),
                Container(
                  height: 112,
                  width: 82,
                  child: Image.asset(
                    "lib/img/exerc.jpeg",
                    height: 100,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 45, 154, 60)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                Container(
                  width: 15,
                ),
                Container(
                  height: 112,
                  width: 82,
                  child: Image.asset(
                    "lib/img/calor.jpeg",
                    height: 100,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 44, 162, 58)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(children: [
              Container(
                width: 18,
              ),
              Container(
                  width: 80,
                  height: 80,
                  child: Text(
                    "1 miles " "Walk",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 43, 176, 59)),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              Container(
                width: 6,
              ),
              Container(
                  width: 80,
                  height: 80,
                  child: Text("45min" " exercies",
                      style: TextStyle(color: Colors.white, fontSize: 11)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 46, 205, 64)),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              Container(
                width: 18,
              ),
              Container(
                  width: 80,
                  height: 80,
                  child: Text(
                    "   ${list[0]["total_cal"]}     Cal",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                      borderRadius: BorderRadius.all(Radius.circular(15))))
            ]),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "Talk With Trainer",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          Container(
              child: Row(children: [
            Container(
                width: 270,
                child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white38,
                        hintText: "   message trainer")),
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
            MaterialButton(
              onPressed: () {},
              child: Icon(Icons.send),
            )
          ])),
          Container(
              margin: EdgeInsets.only(top: 5),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                  borderRadius: BorderRadius.all(Radius.circular(15))))
        ],
      ),
    );
  }
}

//////

///////////////////////////////////////////////////////
class pagefour extends StatefulWidget {
  @override
  State<pagefour> createState() => _pagefourState();
}

class _pagefourState extends State<pagefour> {
  TextEditingController _date = TextEditingController();
  TextEditingController pass = TextEditingController();
  final name = TextEditingController();

  late String x;
  late String x1;
  late String email;

  late String dropdown1 = br;
  late String dropdown2 = br2;
  late String br = "${list[0]["fitness_goal"]}";
  late String br2 = "${list[0]["activity"]}";

  List list = [];
  Future getdata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/editdata.php";
    var response =
        await http.post(Uri.parse(url), body: {'email': home(h).email});
    if (response.statusCode == 200) {
      var red = json.decode(response.body);

      setState(() {
        list.addAll(red);
      });
    }
  }

  usererr() {
    ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
          body: Center(
            child: Text("waiting",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Colors.transparent,
        );
  }

  @override
  void initState() {
    super.initState();
    usererr();
    getdata();
  }

//-------------------//

  Future updata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/update.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': email,
      'activity': x1,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " user already exist !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 92, 128, 220),
          textColor: Color.fromARGB(255, 253, 0, 0),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "sucessfull update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 73, 190, 129),
          textColor: Color.fromARGB(255, 255, 253, 253),
          fontSize: 16.0);
    }
  }
  ////--------------------------//
  ///

  Future updata1() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/updaten.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': email,
      'fitness_goal': x,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " user already exist !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 92, 128, 220),
          textColor: Color.fromARGB(255, 253, 0, 0),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "sucessfull update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 73, 190, 129),
          textColor: Color.fromARGB(255, 255, 253, 253),
          fontSize: 16.0);
    }
  }
///////////////////////////////
  Future updata2() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/updatepas.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': pass.text,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " user already exist !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 92, 128, 220),
          textColor: Color.fromARGB(255, 253, 0, 0),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "sucessfull update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 73, 190, 129),
          textColor: Color.fromARGB(255, 255, 253, 253),
          fontSize: 16.0);
    }
  }
//////////

  Future updata3() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/updatenam.php";
    var response = await http.post(Uri.parse(url), body: {
       'name': name.text,
      'email': email,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " user already exist !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 92, 128, 220),
          textColor: Color.fromARGB(255, 253, 0, 0),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "sucessfull update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 73, 190, 129),
          textColor: Color.fromARGB(255, 255, 253, 253),
          fontSize: 16.0);
    }
  }
  //////////////////////////////

  Future updata4() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/updatebirth.php";
    var response = await http.post(Uri.parse(url), body: {
      'birthdate': _date,
      'email': email,
      
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " user already exist !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 92, 128, 220),
          textColor: Color.fromARGB(255, 253, 0, 0),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "sucessfull update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 73, 190, 129),
          textColor: Color.fromARGB(255, 255, 253, 253),
          fontSize: 16.0);
    }
  }
//////////////////////////////////

  Future adddata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/delete.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': email,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

      //     Navigator.push(context, )
    }
  }
  /////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        height: 50,
      ),
      Container(
        width: 500,
        height: 300,
        alignment: Alignment.bottomLeft,
        child: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/sign.jpeg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 28, 30, 61).withOpacity(0.3),
                BlendMode.darken),
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      Row(
        children: [
          Container(
              margin: EdgeInsets.only(top: 5),
              width: 270,
              child: TextFormField(
                  initialValue: "${list[0]["name"]}",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  decoration: InputDecoration(
                      fillColor: Colors.white38,
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 193, 193, 182)))),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          MaterialButton(
            onPressed: () {
              updata3();
            },
            //  child: Icon(Icons.save_as_outlined),
          )
        ],
      ),
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text("Email  ", style: TextStyle(color: Colors.white)),
          ),
          Container(
              margin: EdgeInsets.only(left: 5),
              height: 45,
              width: 250,
              child: Text(
                email = home(h).email,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(0, 46, 214, 66)),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
        ],
      ),
      Row(
        children: [
          Container(
              width: 270,
              child: TextFormField(
                controller: pass,
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "enter 8 or more char password",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 193, 193, 182))),
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 193, 193, 182)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          MaterialButton(
            onPressed: () {
              updata2();
            },
            child: Icon(Icons.save_as_outlined),
          )
        ],
      ),
      Row(
        children: [
          Container(
              width: 270,
              child: TextFormField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 193, 193, 182))),
                    labelText: 'Birthdate',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 193, 193, 182))),
                initialValue: "${list[0]["birthdate"]}",
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2070));
                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(245, 46, 214, 65)),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          MaterialButton(
            onPressed: () {
              updata4();
            },
            //  child: Icon(Icons.save_as_outlined),
          )
        ],
      ),
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "goal  ",
              style: TextStyle(color: Color.fromARGB(255, 234, 232, 228)),
            ),
            padding: EdgeInsets.only(top: 7),
          ),
          Container(
              height: 25,
              child: DropdownButton<String>(
                dropdownColor: Color.fromARGB(255, 93, 130, 101),
                iconEnabledColor: const Color.fromARGB(255, 254, 254, 254),
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
          MaterialButton(
            onPressed: () {
              updata1();
            },
            child: Icon(Icons.save_as_outlined),
          )
        ],
      ),
      Container(
        height: 15,
      ),
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "activity  ",
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
                iconEnabledColor: const Color.fromARGB(255, 254, 254, 254),
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Colors.grey),
                value: dropdown2,
                hint: Text("select"),
                icon: const Icon(Icons.menu),
                onChanged: (String? newValue1) {
                  setState(() {
                    dropdown2 = newValue1!;
                    x1 = newValue1;
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
                    child: Text('train everyday '),
                  ),
                  DropdownMenuItem<String>(
                    value: '1.2',
                    child: Text('no exercies'),
                  )
                ],
              )),
          MaterialButton(
            onPressed: () {
              updata();
            },
            child: Icon(Icons.save_as_outlined),
          )
        ],
      ),
      MaterialButton(
        color: Color.fromARGB(255, 22, 136, 49),
        textColor: Color.fromARGB(255, 253, 253, 253),
        minWidth: 300,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => autlogin(h)));
        },
        child: Text("Edit inbody analysis"),
        padding: EdgeInsets.all(20),
      ),
      Container(
        height: 7,
      ),
      Row(
        children: [
          Container(
            width: 50,
          ),
          MaterialButton(
            color: Color.fromARGB(255, 7, 1, 20),
            textColor: Colors.white,
            minWidth: 100,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => Login() ),(_)=>false,);
            },
            shape: BeveledRectangleBorder(
                side: BorderSide(color: Color.fromARGB(255, 22, 136, 49))),
            child: Text("Log out"),
            padding: EdgeInsets.all(25),
          ),
          Container(
            width: 10,
          ),
          MaterialButton(
            color: Color.fromARGB(166, 245, 84, 84),
            textColor: Colors.white,
            minWidth: 50,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                adddata();
                                            Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => Login() ),(_)=>false,);

                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 215, 33, 33)),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancle")),
                        ],
                        title: Text("Delete Account"),
                        contentPadding: EdgeInsets.all(20),
                        content: Text("Are you sure you want delete account!"),
                      ));
            },
            shape: BeveledRectangleBorder(
                side: BorderSide(color: Color.fromARGB(255, 108, 21, 21))),
            child: Text("Delete Acc"),
            padding: EdgeInsets.all(5),
          ),
        ],
      )
    ]));
  }
}

///////////////////////////////////
class pagethere extends StatefulWidget {
  const pagethere({super.key});

  @override
  State<pagethere> createState() => _pagethereState();
}

class _pagethereState extends State<pagethere> {
  List list = [];
  int i = 0;

  Future getdata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/meals.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': home(h).email,
    });
    if (response.statusCode == 200) {
      setState(() {
        list = json.decode(response.body);
      });
    }
  }

  usererr() {
    ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
          body: Center(
            child: Text("waiting",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Colors.transparent,
        );
  }

  @override
  void initState() {
    super.initState();
    usererr();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        height: 50,
      ),
      Container(
        width: 500,
        height: 300,
        alignment: Alignment.bottomLeft,
        child: Text(
          "Foods",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/about you.jpeg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 19, 20, 41).withOpacity(0.3),
                BlendMode.darken),
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      Container(
        height: 8,
      ),
      Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "${list[i]["image"]}",
            style: TextStyle(color: Colors.white, fontSize: 14),
          )),
      Container(
        height: 14,
      ),
      Container(
          child: Text(
        "*if you suffer from any diseaes that require a diet,choose the the best plan and consult your doctor",
        style: TextStyle(color: Color.fromARGB(255, 209, 45, 45), fontSize: 11),
      )),
      MaterialButton(
        color: Color.fromARGB(255, 22, 136, 49),
        textColor: Color.fromARGB(255, 11, 6, 6),
        minWidth: 100,
        onPressed: () {
          setState(() {
            if (i != 4) {
              i++;
            } else {
              i = 0;
            }
          });
        },
        child: Text("change diet plan"),
        padding: EdgeInsets.all(20),
      ),
    ]));
  }
}

///////////////////////////////////////////
class pagetwo extends StatefulWidget {
  const pagetwo({super.key});

  @override
  State<pagetwo> createState() => _pagetwoeState();
}

class _pagetwoeState extends State<pagetwo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        height: 50,
      ),
      Container(
        width: 500,
        height: 300,
        alignment: Alignment.bottomLeft,
        child: Text(
          "Workout",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/calor.jpeg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 19, 20, 41).withOpacity(0.3),
                BlendMode.darken),
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(245, 43, 176, 59)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text("Day1", style: TextStyle(color: Colors.white)),
          subtitle: Text("chest+triceps+abs",
              style: TextStyle(color: Color.fromARGB(255, 204, 196, 196))),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("lib/img/calor.jpeg"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => day1(h)));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(245, 43, 176, 59)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text("Day2", style: TextStyle(color: Colors.white)),
          subtitle: Text("back+biceps+lower",
              style: TextStyle(color: Color.fromARGB(255, 208, 203, 203))),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("lib/img/calor.jpeg"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => day2(h)));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(245, 43, 176, 59)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text("Day3", style: TextStyle(color: Colors.white)),
          subtitle: Text("shoulder+traps+abs",
              style: TextStyle(color: Color.fromARGB(255, 209, 202, 202))),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("lib/img/calor.jpeg"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => day3(h)));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(245, 43, 176, 59)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text(
            "Day4",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text("arm+forms",
              style:
                  TextStyle(color: const Color.fromARGB(255, 233, 225, 225))),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("lib/img/calor.jpeg"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => day4(h)));
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 8),
        width: 400,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(245, 43, 176, 59)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text("Day5", style: TextStyle(color: Colors.white)),
          subtitle: Text("calf+leg+abs",
              style: TextStyle(color: Color.fromARGB(255, 220, 217, 217))),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("lib/img/calor.jpeg"),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => day5(h)));
          },
        ),
      ),
      Container(
        height: 7,
      ),
      MaterialButton(
        color: Color.fromARGB(255, 22, 136, 49),
        textColor: Color.fromARGB(255, 253, 253, 253),
        minWidth: 100,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => w_plan1(home(h).email)));
        },
        child: Text("change plan"),
        padding: EdgeInsets.all(20),
      ),
    ]));
  }
}
