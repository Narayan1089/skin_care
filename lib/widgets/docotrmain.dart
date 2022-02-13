
import 'package:flutter/material.dart';

class doctormain extends StatelessWidget {
  final String? name;
  final String? degree;
  final String? eduction;
 const doctormain({
    required this.name,
    required this.degree,
    required this.eduction,

 
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            degree!,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            degree!,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
