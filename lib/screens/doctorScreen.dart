import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/provider/doctorprovider.dart';
import 'package:skin_care/screens/splash_screen.dart';
import 'package:skin_care/utils/colors.dart';
import 'package:skin_care/widgets/docotrmain.dart';

import 'package:skin_care/widgets/doctorinfo.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<doctorprovider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          "Doctors",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SplashScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
          )
        ],
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10, left: 20),
      //       child: Text(
      //         'Near you',
      //         style: TextStyle(
      //           fontSize: 20,
      //           color: Colors.grey[400],
      //         ),
      //       ),
      //     ),
      body: ListView.builder(
          itemCount: data.doctorinfo.length,
          itemBuilder: (context, index) {
            return doctorwidget(
              name: data.doctorinfo[index].name,
              about: data.doctorinfo[index].about,
              address: data.doctorinfo[index].address,
              age: data.doctorinfo[index].age,
              degree: data.doctorinfo[index].degree,
              education: data.doctorinfo[index].education,
              gender: data.doctorinfo[index].gender,
              image: data.doctorinfo[index].image,
              time: data.doctorinfo[index].time,
            );
          }),

      //   ],
      // ),
    );
  }
}

class doctorwidget extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String time;
  final String image;
  final String about;
  final String education;
  final String gender;
  final String degree;
  const doctorwidget({
    required this.degree,
    required this.gender,
    required this.name,
    required this.age,
    required this.address,
    required this.time,
    required this.image,
    required this.about,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: white,
                      width: 0.05,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: CircleAvatar(
                          child: Image.network(image),
                          radius: 22,
                          // backgroundColor: white,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              degree,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              education,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      InkWell(
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Doctorinfo(
                                      about: about,
                                      address: address,
                                      age: age,
                                      education: education,
                                      gender: gender,
                                      image: image,
                                      name: name,
                                      time: time,
                                    )),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
