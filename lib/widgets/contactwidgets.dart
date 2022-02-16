import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';

class profilewidgets extends StatelessWidget {
  final String title;
  final String subString;
  final IconData icon;

  const profilewidgets({
    required this.title,
    required this.subString,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subString,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  title,
                  style: const TextStyle(color: white, fontSize: 18),
                ),
              ],
            ),
            // Icon(
            //   Icons.edit,
            //   color: Colors.green[400],
            // ),
          ],
        ),
      ),
    );
  }
}
