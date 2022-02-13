import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/provider/history.dart';
import 'package:skin_care/widgets/pie_example.dart';

import '../provider/historyprovider.dart';

class ResultScreen extends StatefulWidget {
  var result_name = '';
  double? result_value;
  PickedFile? image;
 
  ResultScreen(
      {Key? key, required this.result_name, required this.result_value,this.image})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var data=Historydata(dieasesname:'', output_percentage: '', image: '', time: '');
  var imagedata;

  @override
  Widget build(BuildContext context) {
    var imagedata=File(widget.image!.path);
final bytes = imagedata.readAsBytesSync();
 String imagedataaf = base64Encode(bytes);
   
initState(){
      setState(() {
         
  });}
  void save(){
    Provider.of<historyprovider>(context, listen: false)
            .addhistory(data);
 

  }
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.skip_previous))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:[ PieChartSample1(
            result_name: widget.result_name,
            result_value: widget.result_value,
          ),
          InkWell(onTap:save,child: Text('save',style: TextStyle(fontSize: 30),))
          ],
          
        ),
      ),
    );
  }
}
