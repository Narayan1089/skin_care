import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:skin_care/widgets/drawer.dart';
import 'package:tflite/tflite.dart';

import '../resources/auth_methods.dart';
import '../widgets/buttons.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.1,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _output = output!;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/trainedModel.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {});
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

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
       actions: [IconButton(icon: Icon(Icons.search_outlined,color: white,size: 30.0,),onPressed: (){},)],
      ),
      drawer: MainDrawer(),
      // (actions: [
      //   IconButton(
      //       icon: const Icon(Icons.logout_sharp),
      //       onPressed: () async {
      //         await AuthMethods().signOut();
      //         Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(
      //             builder: (context) => const LoginScreen(),
      //           ),
      //         );
      //       })
      // ]),
      body: Container(),
      // body: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 24),
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       stops: [0.004, 1],
      //       colors: [
      //         Color(0xFF000000),
      //         Color(0xFF3d3d3d),
      //       ],
      //     ),
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       const SizedBox(
      //         height: 40,
      //       ),
      //       const Center(
      //         child: Text(
      //           'Scan Skin',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontWeight: FontWeight.w500,
      //               fontSize: 28),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 50,
      //       ),
      //       Center(
      //         child: _loading
      //             ? Container(
      //                 width: 250,
      //                 child: Column(
      //                   children: <Widget>[
      //                     Image.asset('assets/se.png'),
      //                     const SizedBox(height: 50),
      //                   ],
      //                 ),
      //               )
      //             : Container(
      //                 child: Column(
      //                 children: <Widget>[
      //                   Container(
      //                     height: 250,
      //                     child: Image.file(_image),
      //                   ),
      //                   const SizedBox(
      //                     height: 30,
      //                   ),
      //                   _output != null
      //                       ? Container(
      //                           padding:
      //                               const EdgeInsets.symmetric(vertical: 5),
      //                           child: Text(
      //                               'It\'s ${_output[0]['label']} \n Probability:${(_output[0]['confidence'] as double).toStringAsFixed(2)}',
      //                               style: const TextStyle(
      //                                   color: Colors.white, fontSize: 10.0)),
      //                         )
      //                       : Container(),
      //                 ],
      //               )),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: const EdgeInsets.only(top: 10),
      //         child: Column(
      //           children: <Widget>[
      //             AppButton(
      //               onClick: pickImage,
      //               btnText: 'From Camera',
      //             ),
      //             const SizedBox(height: 15),
      //             AppButton(
      //               onClick: pickGalleryImage,
      //               btnText: 'From Gallery',
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // const Center(
      //   child: Text("Hello"),
      // ),
    );
  }
}
