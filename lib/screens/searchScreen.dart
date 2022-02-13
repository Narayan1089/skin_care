import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_care/resources/auth_methods.dart';
import 'package:skin_care/screens/result_screen.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:tflite/tflite.dart';

import 'login_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PickedFile? _image;
  bool _loading = false;
  List<dynamic>? _outputs;
  var result_name = '';
  double? result_value;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

//Load the Tflite model
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/trainedModel.tflite",
      labels: "assets/labels.txt",
    );
  }

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
  }

  Future pickImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
      result_name = _outputs![0]['label'];
      result_value = _outputs![0]['confidence'];
    });
    classifyImage(image);
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await AuthMethods().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: const Color.fromARGB(194, 6, 78, 133),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 20),
              child: Text('Take Test',
                  style: TextStyle(
                      color: white, fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            _loading
                ? Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _image == null
                            ? Center(
                                child: Container(
                                  child: SvgPicture.asset("assets/svgc.svg"),
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                              )
                            : Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Image.file(File(
                                  _image!.path,
                                ))),
                        const SizedBox(
                          height: 10,
                        ),
                        _outputs != null
                            ? Text(
                                '${_outputs![0]["label"]},${_outputs![0]["confidence"]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  background: Paint()..color = Colors.white,
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35.0,
                            top: 25,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(7)),
                                child: FlatButton(
                                  onPressed: openCamera,
                                  child: const Text('Take Image',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      )),
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                child: FlatButton(
                                  onPressed: openGallery,
                                  child: const Text('Choose from Gallary',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                      )),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _outputs != null
                            ? Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                child: FlatButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                        result_name: _outputs![0]['label'],
                                        result_value: _outputs![0]
                                            ['confidence'],
                                      ),
                                    ),
                                  ),
                                  child: const Text('Check Result',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                      )),
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
          ],
        )),
      ),
    );
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
    classifyImage(image);
  }

  //camera method
  Future openGallery() async {
    var piture = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = piture;
    });
    classifyImage(piture);
  }
}
