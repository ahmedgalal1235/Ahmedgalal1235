//import libraries
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/TfliteModel.dart';

void main() {
  runApp(const objectdetction());
}

class objectdetction extends StatefulWidget {
  const objectdetction({super.key});

  @override
  State<objectdetction> createState() => _objectdetctionState();
}

class _objectdetctionState extends State<objectdetction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ob identify", //name of app bar
      theme: ThemeData(primarySwatch: Colors.orange), //color of app bar
      home: const TfliteModel()
    );
  }
}
