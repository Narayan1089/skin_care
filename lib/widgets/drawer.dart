import 'package:flutter/material.dart';
import 'package:skin_care/screens/about.dart';
import 'package:skin_care/utils/colors.dart';

class MainDrawer extends StatelessWidget {
  Widget builderList(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: white,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Robotocondensed',
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            color: white),
      ),
      onTap: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bnprimary,
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 10,
                bottom: 15,
              ),
              child: Text('SkinCare',
                  style: TextStyle(
                    fontSize: 25,
                    color: white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const Divider(
            color: white,
          ),
          builderList('Home', Icons.home, () {}),
          builderList('Doctor List', Icons.health_and_safety_outlined, () {}),
          builderList('Health Test', Icons.checklist_rtl_outlined, () {}),
          builderList('History', Icons.history_outlined, () {}),
          builderList('Settings', Icons.person, () {}),
          builderList('About', Icons.info_outline, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const About()),
            );
          }),
          const Divider(
            color: white,
          ),
          builderList('Log out', Icons.logout_outlined, () {}),
          const Divider(
            color: white,
          ),
        ],
      ),
    );
  }
}
