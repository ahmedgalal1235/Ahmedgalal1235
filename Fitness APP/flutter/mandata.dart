import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:testt/home.dart';
import 'package:testt/login.dart';

class mandata extends StatefulWidget {
  // const mandata({super.key});

  late String email;

  mandata(
    String e,
  ) {
    this.email = e;
  }

  @override
  State<mandata> createState() => _mandataState();
}

late String h;

class _mandataState extends State<mandata> {
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController height = TextEditingController();
  late TextEditingController weight = TextEditingController();
  /*late TextEditingController fat = TextEditingController();
  late TextEditingController mass = TextEditingController();*/

  Future adddata() async {
    var url = "https://fitnessapplication111.000webhostapp.com/project/fun/emtoid.php";
    var response = await http.post(Uri.parse(url), body: {
      'height': height.text,
      'weight': weight.text,
      'email': h,
     // 'fat': fat.text,
      //'mass': mass.text,
    });
    var data = json.decode(response.body);

    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: " welcome to fitness world",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 7, 247, 67),
          textColor: Color.fromARGB(255, 246, 244, 244),
          fontSize: 16.0);

      Navigator.push(context, MaterialPageRoute(builder: (context) => home(h)));
    } else {
      Fluttertoast.showToast(
          msg: "????????",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/img/runt.jpeg"),
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 13, 1, 37).withOpacity(0.5),
                      BlendMode.darken),
                  fit: BoxFit.fill),
            ),
            child: Form(
                key: formstate,                child: SingleChildScrollView(      child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(h = this.widget.email),
                      height: 0,
                    ),Container(height: 50,),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 1200,
                      height: 85,
                      child: Text(" Enter Data",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 40)),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'weight  (KG)',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: weight,
                        validator: (value) {
                          if (value!.length > 3 || value!.isEmpty) {
                            return "enter valid weight";
                          }
                        }),
                    Container(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 193, 182))),
                            labelText: 'height  (CM)',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 193, 193, 182))),
                        controller: height,
                        validator: (value) {
                          if (value!.length > 3 || value!.isEmpty) {
                            return "enter valid height";
                          }
                        }),
                /*    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 193, 193, 182))),
                          labelText: 'Fat (%)  ',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 193, 193, 182))),
                      controller: fat,
                    ),
                    Container(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 193, 193, 182))),
                          labelText: 'Mass Muscles (KG)  ',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 193, 193, 182))),
                      controller: mass,
                    ),*/
                    Container(
                      height: 75,
                    ),
                    MaterialButton(
                      color: Color.fromARGB(255, 22, 136, 49),
                      textColor: Colors.white,
                      minWidth: 100,
                      onPressed: () {
                        adddata();
                     
                      },
                      child: Text("Enter"),
                      padding: EdgeInsets.all(20),
                    ),Container(height: 300,)
                  ],
                )))));
  }
}
