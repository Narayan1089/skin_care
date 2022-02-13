import 'package:flutter/cupertino.dart';
import 'package:skin_care/provider/doctor.dart';

class doctorprovider with ChangeNotifier{
  List<doctor> _doctor=[];

  doctorprovider(this._doctor);

   List<doctor> get orders {
    return [..._doctor];
  }
}