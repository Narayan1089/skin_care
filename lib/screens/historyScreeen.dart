// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/utils/colors.dart';

import '../utils/utils.dart';

class HistoryScreen extends StatefulWidget {
  final String uid;
  const HistoryScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  getData() async {
    setState(() {});
    try {
      await FirebaseFirestore.instance
          .collection('results')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      await FirebaseFirestore.instance
          .collection('results')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          "    History",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: white,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   physics:  ScrollPhysics(),
      //   child: Column(children: [
      //     const Padding(
      //       padding: EdgeInsets.all(30.0),
      //       child: Text(" Previous test data",style:TextStyle(color: Colors.white,fontSize: 25),),
      //     ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('results')
            .where('uid', isEqualTo: widget.uid)
            .get(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return historywidgets(
                dieasesname: snapshot.data!.docs[index]['diseaseName'],
                time: "22-10-1998",
                result: snapshot.data!.docs[index]['result'],
              );
            },
          );
        },
      ),
    );
  }
}

//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('results').snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               return historywidgets(
//                 dieasesname: snapshot.data!.docs[index]['diseaseName'],
//                 time: "22-10-1998",
//                 result: snapshot.data!.docs[index]['result'],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class historywidgets extends StatelessWidget {
  final String dieasesname;
  final String time;
  final String result;
  const historywidgets({
    required this.dieasesname,
    required this.time,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    // String data = result.round();
    double resultData = double.parse(result);
    int tusharOP = resultData.round();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: white,
                width: 0.05,
              ),
            ),
            child: ListTile(
                title: Text(
                  dieasesname,
                  style: TextStyle(color: white, fontSize: 22),
                ),
                subtitle:
                    Text(time, style: TextStyle(color: white, fontSize: 15)),
                trailing: (tusharOP < 1)
                    ? Icon(
                        Icons.check_box_outlined,
                        color: Colors.red,
                        size: 40,
                      )
                    : Icon(
                        Icons.check_box_outlined,
                        color: Colors.green,
                        size: 40,
                      )),
          ),
        ),
      ),
    );
  }
}


// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:skin_care/utils/colors.dart';

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({Key? key}) : super(key: key);

//   @override
//   _HistoryScreenState createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         shadowColor: Colors.grey,
//         backgroundColor: mobileBackgroundColor,
//         title: const Text(
//           "    History",
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: white, fontSize: 25),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.search_outlined,
//               color: white,
//               size: 30.0,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(30.0),
//             child: Text(
//               " Previous test data",
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 100,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.white.withOpacity(0.1),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       border: Border.all(
//                         color: white,
//                         width: 0.05,
//                       ),
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         "disease name ",
//                         style: TextStyle(color: white, fontSize: 22),
//                       ),
//                       subtitle: Text("Date:22/7/21",
//                           style: TextStyle(color: white, fontSize: 15)),
//                       trailing: Icon(
//                         Icons.check_box_outlined,
//                         color: Colors.red,
//                         size: 40,
//                       ),
//                     )),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
