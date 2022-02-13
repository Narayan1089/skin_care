

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:skin_care/provider/history.dart';
import 'package:skin_care/provider/history.dart';

class historyprovider with ChangeNotifier {
  final List<Historydata> _historydata = [];
  List<Historydata> get history {
    return [..._historydata];
  }

  Future<void> addhistory(Historydata historydata) async {
    final history = Historydata(
      dieasesname: historydata.dieasesname,
      output_percentage: historydata.output_percentage,
      image: historydata.image,
      time: historydata.time,
    );
    print(history.time);
    print(history.dieasesname);
    _historydata.add(history);

     Map<String,dynamic> demodata={
       "dieasesname":history.dieasesname,
       "output_percentage":historydata.output_percentage,
       "image":historydata.image,
       "time":historydata.time,
     };
     CollectionReference collectionReference=FirebaseFirestore.instance.collection('history');
     collectionReference.add(demodata);
    
    notifyListeners();

  }
}
