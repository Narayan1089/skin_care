import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/widgets/pie_example.dart';

import '../provider/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/utils.dart';

class ResultScreen extends StatefulWidget {
  var result_name = '';
  double? result_value;

  ResultScreen(
      {Key? key, required this.result_name, required this.result_value})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isLoading = false;

  void postImage(String uid, String diseaseName, String result) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res =
          await FireStoreMethods().uploadPost(uid, diseaseName, result);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Result uploaded successfully',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => postImage(
              FirebaseAuth.instance.currentUser!.uid,
              widget.result_name,
              widget.result_value.toString(),
              // userProvider.getUser.uid,
            ),
            icon: const Icon(
              Icons.save,
            ),
            tooltip: 'Save Result',
          )
        ],
      ),
      body: PieChartSample1(
        result_name: widget.result_name,
        result_value: widget.result_value,
      ),
    );
  }
}
