// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:skin_care/widgets/contactwidgets.dart';
import 'package:skin_care/models/user.dart' as model;

import '../provider/user_provider.dart';
import '../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getUserData();
  }

  getUserData() async {
    try {
      // final model.User user = Provider.of<UserProvider>(context).getUser;
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      userData = userSnap.data()!;
      // commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final Future<DocumentSnapshot<Map<String, dynamic>>> userSnap = FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.grey,
          backgroundColor: mobileBackgroundColor,
          actions: [
            Center(
                child: Text(
              "Save",
              style: TextStyle(fontSize: 18, color: Colors.green[400]),
            ))
          ],
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )),
      body:
          // userData == null
          //     ? CircularProgressIndicator()
          //     :
          Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
                child: CircleAvatar(
              child: Text(
                userData['username'][0],
                style: TextStyle(fontSize: 30),
              ),
              radius: 50,
              backgroundColor: white,
            )),
          ),
          profilewidgets(
            icon: Icons.person,
            subString: 'Name',
            title: userData['username'],
          ),
          profilewidgets(
            icon: Icons.info_outline,
            subString: 'Email',
            title: userData['email'],
          ),
          // profilewidgets(
          //   icon: Icons.contacts_outlined,
          //   subString: 'contact',
          //   title: "+9167090343",
          // ),
        ],
      ),
    );
  }
}
