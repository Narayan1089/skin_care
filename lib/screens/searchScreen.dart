import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File? _image;
  bool _loading = false;
  List<dynamic>? _output;
  final _picker = ImagePicker();

  pickImage() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/trainedModel.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat vs Dog Classifier'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 160.0),
            _image == null
                ? Text('No image selected')
                : Container(
                    child: Image.file(_image!),
                    height: 250.0, // Fixed height for image
                  ),
            SizedBox(height: 20.0),
            _output != null ? Text('${_output![0]['label']}') : Container(),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Take Picture'),
            ),
            ElevatedButton(
              onPressed: pickGalleryImage,
              child: Text('Camera Roll'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:skin_care/utils/colors.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:skin_care/widgets/result.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:io';

// import '../widgets/buttons.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {

//   bool _loading = false;
//   File? _image;
//   List? _output;
//   final picker = ImagePicker();
//   var result_name = '';
//   double? result_value;

//   pickImage() async {
//     var image = await picker.getImage(source: ImageSource.camera);

//     if (image == null) return null;

//     setState(() {
//       _image = File(image.path);
//     });
//     classifyImage(_image!);
//   }

//   pickGalleryImage() async {
//     var image = await picker.getImage(source: ImageSource.gallery);

//     if (image == null) return null;

//     setState(() {
//       _image = File(image.path);
//     });
//     classifyImage(_image!);
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
//       result_name = _output![0]['label'];
//       result_value = _output![0]['confidence'];
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
//       backgroundColor: const Color.fromARGB(194, 6, 78, 133),
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         const Padding(
//           padding: EdgeInsets.only(top: 70.0, left: 30),
//           child: Text(
//             "Take Test ",
//             style: TextStyle(
//                 color: white, fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Center(
//           child: _loading
//               ? Container(
//                   child: SvgPicture.asset("assets/svgc.svg"),
//                   height: MediaQuery.of(context).size.height * 0.6,
//                   width: MediaQuery.of(context).size.width * 0.8,
//                 )
//               : Container(
//                   height: 200,
//                   child: Image.file(_image!),
//                 ),
//         ),
//         _output != null
//             ? Container(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: Text(
//                     'It\'s ${_output![0]['label']} \n Probability:${(_output![0]['confidence'] as double).toStringAsFixed(1)}',
//                     style:
//                         const TextStyle(color: Colors.white, fontSize: 10.0)),
//               )
//             : Container(),
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 35.0,
//             top: 25,
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.blue, borderRadius: BorderRadius.circular(7)),
//                 child: FlatButton(
//                   onPressed: pickImage,
//                   child: const Text('Take Image',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       )),
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Container(
//                 width: 150,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(7)),
//                 child: FlatButton(
//                   onPressed: pickGalleryImage,
//                   child: const Text('Choose from Gallary',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 12,
//                       )),
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         AppButton(
//           onClick: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ResultScreen(
//                 result_name: result_name,
//                 result_value: result_value,
//               ),
//             ),
//           ),
//           btnText: 'See Result',
//         ),
//       ]),
//     );
//   }
// }
