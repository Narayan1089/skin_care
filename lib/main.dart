import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/provider/doctorprovider.dart';
import 'package:skin_care/provider/historyprovider.dart';

import 'package:skin_care/screens/navigate_screen.dart';

import 'provider/user_provider.dart';
import 'screens/login_screen.dart';
import 'screens/profileScreen.dart';
import 'screens/searchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: doctorprovider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
         ChangeNotifierProvider.value(
          value: historyprovider(),
        ),
        
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SkinCare',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home:NavigateScreen()
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.active) {
        //       // Checking if the snapshot has any data or not
        //       if (snapshot.hasData) {
        //         // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
        //         return const NavigateScreen();
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('${snapshot.error}'),
        //         );
        //       }
        //     }

        //     // means connection to future hasnt been made yet
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }

        //     return const LoginScreen();
        //   },
        // ),
      ),
      
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'SkinCare',
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: mobileBackgroundColor,
    //   ),
    //   home:NavigateScreen(),
    // home:
    // StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       // Checking if the snapshot has any data or not
    //       if (snapshot.hasData) {
    //         // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
    //         return const NavigateScreen();
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Text('${snapshot.error}'),
    //         );
    //       }
    //     }

    //     // means connection to future hasnt been made yet
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }

    //     return const LoginScreen();
    //     },
    //   ),
    // );
  }
}
