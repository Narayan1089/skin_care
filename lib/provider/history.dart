import 'dart:io';

import 'package:flutter/cupertino.dart';

class Historydata with ChangeNotifier{
late final String dieasesname;
late final String output_percentage;
late final String image;
late final String time;

Historydata({
 required this.dieasesname,
 required this.output_percentage,
 required this.image,
 required this.time,
});

}