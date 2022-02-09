import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1,
        shadowColor: Colors.grey,backgroundColor: mobileBackgroundColor,title: Center(child: Text('Profile',style:TextStyle(color: white,fontSize: 25,fontWeight: FontWeight.bold)))),

    );
  }
}