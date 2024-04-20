import 'package:flutter/material.dart';
import 'package:testt/auth.dart';
import 'package:testt/home.dart';
import 'package:testt/signup.dart';
//import 'package:flutter_application_1/reere.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testt/goal.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_notie/flutter_notie.dart';
import 'package:mailer/mailer.dart';
import 'package:testt/video.dart';

class Login extends StatelessWidget {
/*
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;




  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}*/

////////
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller1 = TextEditingController();

  Future adddata(BuildContext context) async {
    var url =
        "https://fitnessapplication111.000webhostapp.com/project/fun/login.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': controller2.text,
      'password': controller1.text,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: "welcome back",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 34, 148, 41),
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(context,MaterialPageRoute(builder: (context) => home(controller2.text)));

      //     Navigator.push(context, )
    } else {
      Fluttertoast.showToast(
          msg: "check the email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 86, 137, 199),
          textColor: Color.fromARGB(255, 188, 4, 4),
          webBgColor: "LinearGradient(to right,#00b09b,#96c93d)",
          fontSize: 16.0);
      print("failed");
    }
    /* var data = json.encode(res.body);
    if (data == "done") {
      Navigator.push(cont, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("hellllllllll");
    }*/
  }

////////////////////////////

  Future resetpass(BuildContext context) async {
    var url = "http://192.168.1.10/project/fun/forgpass.php";
    var response = await http.post(Uri.parse(url), body: {
      'email': controller2.text,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: "check your mail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 34, 148, 41),
          textColor: Colors.white,
          fontSize: 16.0);

      //     Navigator.push(context, )
    } else {
      Fluttertoast.showToast(
          msg: "not valid email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 66, 77, 67),
          textColor: const Color.fromARGB(255, 246, 7, 7),
          fontSize: 16.0);
      print("failed");
    }
    /* var data = json.encode(res.body);
    if (data == "done") {
      Navigator.push(cont, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("hellllllllll");
    }*/
  }

/////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 16, 26),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Container(
              margin: EdgeInsets.only(left: 65),
              alignment: Alignment.topRight,
              child: Text("  Fitness",
                  style: TextStyle(
                      color: const Color.fromARGB(205, 255, 255, 255),
                      fontSize: 30)),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(" App",
                  style: TextStyle(
                      color: Color.fromARGB(205, 41, 176, 48), fontSize: 30)),
            ),
          ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/sign.jpeg"),
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 15, 16, 31).withOpacity(0.88),
                      BlendMode.darken),
                  fit: BoxFit.none),
            ),                child: SingleChildScrollView(      child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(height: 100,),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 1200,
                  height: 85,
                  child: Text(" Log in",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 40)),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 193, 193, 182))),
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 193, 193, 182))),
                  controller: controller2,
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 193, 193, 182))),
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 193, 193, 182))),
                  controller: controller1,
                ),
                SizedBox(
                  width: 50,
                ),
                MaterialButton(
                  //  color: Color.fromARGB(255, 22, 136, 49),
                  textColor: Colors.white,
                  onPressed: () {
                    //resetpass(context);



                  },

                  child: Text(
                    "Forget you Password?",
                  ),
                  padding: EdgeInsets.all(0),
                ),
                Container(
                  height: 20,
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 22, 136, 49),
                  textColor: Color.fromARGB(255, 253, 253, 253),
                  minWidth: 400,
                  onPressed: () {
                    adddata(context);
                  },
                  child: Text("Login"),
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  height: 10,
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 7, 1, 20),
                  textColor: Colors.white,
                  minWidth: 400,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  shape: BeveledRectangleBorder(
                      side:
                          BorderSide(color: Color.fromARGB(255, 22, 136, 49))),
                  child: Text("Sign Up"),
                  padding: EdgeInsets.all(25),
                  hoverColor: Color.fromARGB(255, 22, 136, 49),
                ),
               
            ]),
            )));
  }
}
