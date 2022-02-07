import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            })
      ]),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }
}
