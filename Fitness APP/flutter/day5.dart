import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:testt/day1.dart';
import 'package:testt/home.dart';
import 'package:testt/video.dart';
import 'package:testt/w_plan1.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_windowmanager/flutter_windowmanager.dart';


void main() async {
  WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class day5 extends StatefulWidget {
  late String email;

  day5(
    String e,
  ) {
    this.email = e;
  }

  @override
  State<day5> createState() => _day5();
}

late String h;
late String v;

int i = 0;

class _day5 extends State<day5> {
  List list = [];
  Future getdata() async {
    var url = "https://fitnessapplication111.000webhostapp.com/project/fun/workout/day5.php";
    var response = await http.post(
      Uri.parse(url),
      body: {'email': this.widget.email,}
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 1000,
            color: Color.fromARGB(255, 42, 39, 59),
            child: SingleChildScrollView(
              child: Column(
                children: [Container(height: 80,),
                       MaterialButton(
            onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => video(v)));

            },
            child: Icon(Icons.play_circle,size: 80,),
          )
,Container(height: 20,)
                    ,Container(height: 0,
                                       child:Text(v="${list[i]["youtubeURL"]}")

                    ),
                //Text("${list[i]["youtubeURL"]}")),
                  Row(
                    children: [
                      Container(
                        width: 0,
                        height: 0,
                        child: Text(h = this.widget.email),
                      ),Container(height: 60,),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[i]["exercise_name"]}",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("Body part: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[i]["target"]}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("Equipment:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[i]["Category"]}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("Force: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[i]["Force"]}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("Instruction: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[i]["steps"]}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("Rest: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text("${list[8]["rest"]}",
                            style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(" Reps: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child:
                            Text("${list[8]["reps"]}", style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(" Sets: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 146, 49))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child:
                            Text("${list[8]["sets"]}", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 270,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(245, 43, 176, 59)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          "Make the trainer check your workout ",
                          style: TextStyle(color: Colors.white,fontSize: 10),
                        ),
                      ),
                      MaterialButton(minWidth: 20,
                        onPressed: () {},
                        child: Icon(Icons.camera_alt),
                        color: Color.fromARGB(243, 35, 203, 66),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (i != 0) {
                              i--;
                            } else {
                              i = 0;
                            }
                          });
                        },
                        child: Icon(Icons.arrow_back_ios),
                        color: Color.fromARGB(243, 35, 203, 66),
                      ),
                      Container(
                        child: Text(" ${i + 1} of 8"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (i != 7) {
                              i++;
                            }else{
                              Fluttertoast.showToast(
          msg: "Excellent,our Beast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 34, 148, 41),
          textColor: Colors.white,
          fontSize: 16.0);
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => home(home(h).email)));


                            }
                          });
                        },
                        child: Icon(Icons.arrow_forward_ios),
                        color: Color.fromARGB(243, 35, 203, 66),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
