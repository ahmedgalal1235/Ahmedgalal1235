import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({super.key});

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imagesel = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  //load tflite model
  Future loadModel() async {
    Tflite.close();
    String result;
    result = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
  }

  Future imagedetect(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _results = recognitions!;
      _image = image;
      imagesel = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ob identify"),backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            (imagesel)
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: Image.file(_image),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 150),
                    child: Opacity(
                      opacity: 0.8,
                      child: Center(
                        child: Text("you are not select an image"),
                      ),
                    ),
                  ),
            SingleChildScrollView(
                child: Column(
                    children: (imagesel)
                        ? _results.map((result) {
                            return Card(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "${result['label']}-${result['confidence'].toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 18),
                                ),
                              ),
                            );
                          }).toList()
                        : []))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: pickimage,backgroundColor: Colors.amber,
          tooltip: "detect image" ,
          child: const Icon(Icons.image_search),
        ));
  }

//function to choose image
  Future pickimage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imagedetect(image);
  }
}
