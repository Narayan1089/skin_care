import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_care/screens/result_screen.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      // appBar: AppBar(
      //   title: const Text('Image Classification'),
      //   backgroundColor: Colors.black,
      // ),
      // backgroundColor: const Color.fromARGB(194, 6, 78, 133),
      // body: _loading
      //     ? Container(
      //         alignment: Alignment.center,
      //         child: const CircularProgressIndicator(),
      //       )
      //     : Container(
      //         width: MediaQuery.of(context).size.width,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             _image == null
      //                 ? Center(
      //                     child: Container(
      //                       child: SvgPicture.asset("assets/svgc.svg"),
      //                       height: MediaQuery.of(context).size.height * 0.6,
      //                       width: MediaQuery.of(context).size.width * 0.8,
      //                     ),
      //                   )
      //                 : Image.file(File(_image!.path)),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             _outputs != null
      //                 ? Text(
      //                     '${_outputs![0]["label"]},${_outputs![0]["confidence"]}',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 10.0,
      //                       background: Paint()..color = Colors.white,
      //                     ),
      //                   )
      //                 : Container(),
      //             result_name = _outputs![0]['label'],
      //             result_value = _outputs![0]['confidence'],
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 left: 35.0,
      //                 top: 25,
      //               ),
      //               child: Row(
      //                 children: [
      //                   Container(
      //                     width: 150,
      //                     decoration: BoxDecoration(
      //                         color: Colors.blue,
      //                         borderRadius: BorderRadius.circular(7)),
      //                     child: FlatButton(
      //                       onPressed: openCamera,
      //                       child: const Text('Take Image',
      //                           style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                           )),
      //                       color: Colors.blue,
      //                     ),
      //                   ),
      //                   const SizedBox(width: 15),
      //                   Container(
      //                     width: 150,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(7)),
      //                     child: FlatButton(
      //                       onPressed: openGallery,
      //                       child: const Text('Choose from Gallary',
      //                           style: TextStyle(
      //                             color: Colors.blue,
      //                             fontSize: 12,
      //                           )),
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             _outputs != null &&
      //                     result_name != null &&
      //                     result_value != null
      //                 ? Container(
      //                     width: 150,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(7)),
      //                     child: FlatButton(
      //                       onPressed: () => Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => ResultScreen(
      //                             result_name: result_name,
      //                             result_value: result_value!,
      //                           ),
      //                         ),
      //                       ),
      //                       child: const Text('Check Result',
      //                           style: TextStyle(
      //                             color: Colors.blue,
      //                             fontSize: 12,
      //                           )),
      //                       color: Colors.white,
      //                     ),
      //                   )
      //                 : Container(),
      //           ],
      //         ),
      //       ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _optiondialogbox,
      //   backgroundColor: Colors.purple,
      //   child: const Icon(Icons.image),
      // ),
    );
  }

  //camera method
  Future<void> _optiondialogbox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.purple,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text(
                      "Take a Picture",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openCamera,
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: const Text(
                      "Select image ",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
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



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:skin_care/utils/colors.dart';
// import 'package:skin_care/widgets/drawer.dart';
// import 'package:tflite/tflite.dart';

// import '../resources/auth_methods.dart';
// import '../widgets/buttons.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _loading = false;
//   late File _image;
//   late List _output;
//   final picker = ImagePicker();

//   pickImage() async {
//     var image = await picker.getImage(source: ImageSource.camera);

//     if (image == null) return null;

//     setState(() {
//       _image = File(image.path);
//     });
//     classifyImage(_image);
//   }

//   pickGalleryImage() async {
//     var image = await picker.getImage(source: ImageSource.gallery);

//     if (image == null) return null;

//     setState(() {
//       _image = File(image.path);
//     });
//     classifyImage(_image);
//   }

//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//         path: image.path,
//         numResults: 2,
//         threshold: 0.1,
//         imageMean: 127.5,
//         imageStd: 127.5);

//     setState(() {
//       _loading = false;
//       _output = output!;
//     });
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//       model: 'assets/trainedModel.tflite',
//       labels: 'assets/labels.txt',
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     loadModel().then((value) {});
//   }

//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         shadowColor: Colors.grey,
//         backgroundColor: mobileBackgroundColor,
//         title: const Text(
//           "Skincare",
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: white, fontSize: 25),
//         ),
//        actions: [IconButton(icon: Icon(Icons.search_outlined,color: white,size: 30.0,),onPressed: (){},)],
//       ),
//       drawer: MainDrawer(),
//       // (actions: [
//       //   IconButton(
//       //       icon: const Icon(Icons.logout_sharp),
//       //       onPressed: () async {
//       //         await AuthMethods().signOut();
//       //         Navigator.of(context).pushReplacement(
//       //           MaterialPageRoute(
//       //             builder: (context) => const LoginScreen(),
//       //           ),
//       //         );
//       //       })
//       // ]),
//       body: Container(),
//       // body: Container(
//       //   padding: const EdgeInsets.symmetric(horizontal: 24),
//       //   decoration: const BoxDecoration(
//       //     gradient: LinearGradient(
//       //       begin: Alignment.topCenter,
//       //       end: Alignment.bottomCenter,
//       //       stops: [0.004, 1],
//       //       colors: [
//       //         Color(0xFF000000),
//       //         Color(0xFF3d3d3d),
//       //       ],
//       //     ),
//       //   ),
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: <Widget>[
//       //       const SizedBox(
//       //         height: 40,
//       //       ),
//       //       const Center(
//       //         child: Text(
//       //           'Scan Skin',
//       //           style: TextStyle(
//       //               color: Colors.white,
//       //               fontWeight: FontWeight.w500,
//       //               fontSize: 28),
//       //         ),
//       //       ),
//       //       const SizedBox(
//       //         height: 50,
//       //       ),
//       //       Center(
//       //         child: _loading
//       //             ? Container(
//       //                 width: 250,
//       //                 child: Column(
//       //                   children: <Widget>[
//       //                     Image.asset('assets/se.png'),
//       //                     const SizedBox(height: 50),
//       //                   ],
//       //                 ),
//       //               )
//       //             : Container(
//       //                 child: Column(
//       //                 children: <Widget>[
//       //                   Container(
//       //                     height: 250,
//       //                     child: Image.file(_image),
//       //                   ),
//       //                   const SizedBox(
//       //                     height: 30,
//       //                   ),
//       //                   _output != null
//       //                       ? Container(
//       //                           padding:
//       //                               const EdgeInsets.symmetric(vertical: 5),
//       //                           child: Text(
//       //                               'It\'s ${_output[0]['label']} \n Probability:${(_output[0]['confidence'] as double).toStringAsFixed(2)}',
//       //                               style: const TextStyle(
//       //                                   color: Colors.white, fontSize: 10.0)),
//       //                         )
//       //                       : Container(),
//       //                 ],
//       //               )),
//       //       ),
//       //       Container(
//       //         width: MediaQuery.of(context).size.width,
//       //         margin: const EdgeInsets.only(top: 10),
//       //         child: Column(
//       //           children: <Widget>[
//       //             AppButton(
//       //               onClick: pickImage,
//       //               btnText: 'From Camera',
//       //             ),
//       //             const SizedBox(height: 15),
//       //             AppButton(
//       //               onClick: pickGalleryImage,
//       //               btnText: 'From Gallery',
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       // const Center(
//       //   child: Text("Hello"),
//       // ),
//     );
//   }
// }
