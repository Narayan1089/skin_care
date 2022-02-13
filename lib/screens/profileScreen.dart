import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:skin_care/widgets/contactwidgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.grey,
          backgroundColor: mobileBackgroundColor,
          actions: [
            Center(
                child: Text(
              "save",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
                child: CircleAvatar(
              child: Icon(Icons.safety_divider_rounded),
              radius: 70,
              backgroundColor: white,
            )),
          ),
          profilewidgets(icon: Icons.person,subString:'name',title: "tushar gharge",),
          profilewidgets(icon: Icons.info_outline,subString:'about',title: "Strong af",),
          profilewidgets(icon: Icons.contacts_outlined,subString:'contact',title: "+9167090343",),
                 ],
      ),
    );
  }
}
