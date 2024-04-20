import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_notie/flutter_notie.dart';
import 'package:testt/goal.dart';
import 'package:testt/login.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testt/auth.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signup1();
}

class _signup1 extends State<signup> {
  GlobalKey<FormState> formstate = GlobalKey();
  bool isbuttonactive = true;
  late TextEditingController controller = TextEditingController();
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();
  late TextEditingController controller3 = TextEditingController();
//gffffffffffffffffffffffff

  Future adddata() async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/adddata.php";
    var response = await http.post(Uri.parse(url), body: {
      'name': controller3.text,
      'email': controller2.text,
      'birthdate': _date.text,
      'password': controller1.text,
      'gender': x,
      'confirmpass': controller.text,
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      Fluttertoast.showToast(
          msg: "successful registeration",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

              Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => goal(controller2.text) ),(_)=>false,);


    }
    /* var data = json.encode(res.body);
    if (data == "done") {
      Navigator.push(cont, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("hellllllllll");
    }*/
  }

//hgfcff
  TextEditingController _date = TextEditingController();
  late String x;
  String? dropdown = null;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();

    controller.addListener(() {
      final isbuttonactive = controller.text.isNotEmpty &
          controller1.text.isNotEmpty &
          controller2.text.isNotEmpty &
          controller3.text.isNotEmpty &
                    controller3.text.contains(RegExp(r'^[a-z]+$'))&

          controller2.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      );
      setState(() => this.isbuttonactive = isbuttonactive);
    });
    controller1.addListener(() {
      final isbuttonactive = controller.text.isNotEmpty &
          controller1.text.isNotEmpty &
          controller2.text.isNotEmpty &
          controller3.text.isNotEmpty &
          controller3.text.contains(RegExp(r'^[a-z]+$'))&
          controller2.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      );

      setState(() => this.isbuttonactive = isbuttonactive);
    });
    controller2.addListener(() {
      final isbuttonactive = controller.text.isNotEmpty &
          controller1.text.isNotEmpty &
          controller2.text.isNotEmpty &
          controller3.text.isNotEmpty &
                    controller3.text.contains(RegExp(r'^[a-z]+$'))&

          controller2.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      );

      setState(() => this.isbuttonactive = isbuttonactive);
    });
    controller3.addListener(() {
      final isbuttonactive = controller.text.isNotEmpty &
          controller1.text.isNotEmpty &
          controller2.text.isNotEmpty &
          controller3.text.isNotEmpty &
                    controller3.text.contains(RegExp(r'^[a-z]+$'))&

          controller2.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      );

      setState(() => this.isbuttonactive = isbuttonactive);
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 16, 26),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: BackButton(
            color: Colors.white,
          ),
          
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/sign.jpeg"),
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 15, 16, 32).withOpacity(0.88),
                      BlendMode.darken),
                  fit: BoxFit.none),
            ),
            child: Form(
                key: formstate,
                child: SingleChildScrollView(      child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 1200,
                      height: 85,
                      margin: EdgeInsets.only(left: 40),
                      child: Text(" Sign up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 40)),
                    ),
                    TextFormField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: controller3,
                        validator: (value) {
                          if (value!.isEmpty) {}
                        }),
                    TextFormField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: controller2,
                        validator: (value) {
                          if (value!.isEmpty) {}
                          if (!value.contains('@')) {}
                        }),
                    TextFormField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'Birthdate',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: _date,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2010),
                              firstDate: DateTime(1920),
                              lastDate: DateTime(2014));
                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) < 18) {}
                        }),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            color: Color.fromARGB(255, 234, 232, 228)),
                      ),
                      padding: EdgeInsets.only(top: 7),
                    ),
                    Container(
                        height: 33,
                        child: DropdownButton<String>(
                          dropdownColor: Color.fromARGB(255, 93, 130, 101),
                          iconEnabledColor:
                              const Color.fromARGB(255, 254, 254, 254),
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor: Colors.grey),
                          value: dropdown,
                          icon: const Icon(Icons.menu),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdown = newValue!;
                              x = newValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: null,
                              child: Text('select'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'female',
                              child: Text('Female'),
                            )
                          ],
                        )),
                    TextFormField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: controller1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() => isbuttonactive = false);
                          }
                          if (value.length < 8) {
                            return "enter 8 or more char password";
                          }
                        }),
                    TextFormField(
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 193, 193, 182))),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 193, 193, 182))),
                      controller: controller,
                      validator: (value) {
                        if (controller.value != controller1.value) {}
                      },
                    ),
                    Container(
                      height: 2,
                    ),
                    MaterialButton(
                      color: Color.fromARGB(255, 22, 136, 49),
                      textColor: Colors.white,
                      minWidth: 400,
                      onPressed: isbuttonactive
                          ? () {
                              adddata();

                              if (formstate.currentState!.validate()) {
                                setState(() => isbuttonactive = false);
                              } else {
                                FlutterNotie.error(context,
                                    message:
                                        "check to faill all field correctly");
                                print("error");
                              }
                            }
                          : null,
                      child: Text("Create Account"),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
    )))));
  }
}
/*TextField(
        controller: _date,
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
      ),*/