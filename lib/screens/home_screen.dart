import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_care/screens/result_screen.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:skin_care/widgets/drawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          "Skincare",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 25),
        ),
       actions: [IconButton(icon: const Icon(Icons.search_outlined,color: white,size: 30.0,),onPressed: (){},)],
      ),
      drawer: MainDrawer(),
     
    );
  }
}