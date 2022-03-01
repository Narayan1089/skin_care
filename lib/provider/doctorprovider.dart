import 'package:flutter/cupertino.dart';
import 'package:skin_care/provider/doctor.dart';

class doctorprovider with ChangeNotifier {
  final List<doctor> doctorinfo = [
    doctor(
        name: "Dr.seema limbachiya",
        age: "53",
        address: "12, GeetanjaliPur,mumbai - 400021",
        time: "9 am - 2 pm ",
        image:
            "assets/seemalemachiya.jpg",
        about:
            "I am all rounder in every field , but my specialization in making poles and giving pleasure to all",
        education: "Master of ChingChong",
        gender: "Male",
        degree: "B.E in Linkedin"),
    doctor(
        name: "Dr. Sana Shah",
        age: "38",
        address: "Availble on Hornhub",
        time: "8 pm -11 pm",
        image:
            "assets/sanashah.jpg",
        about:
            "I am krutik from safale they called me has chava of that and specilist in making memes and watching MMA ,if their is feture of live let meet me",
        education: "PhD. in MMA",
        gender: "Male",
        degree: "MMA World Champion"),
    doctor(
        name: "Dr.Jay Sons",
        age: "31",
        address: "Availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "assets/allenpaul.jpg",
        about:
            "I am all rounder in every field , but my specialization in making poles and giving all",
        education: "Master in PhD",
        gender: "Male",
        degree: "World Class Bunker"),
    doctor(
        name: "Dr. Donnney Daniels",
        age: "31",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "assets/ankurekhyadhav.jpg",
        about:
            "I am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "Master in Dane",
        gender: "Male",
        degree: "WhatsApp University"),
    doctor(
        name: "Dr.Tapsi Raj",
        age: "31",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image: "assets/tapasiraj.jpg",
        about:
            "I am all rounder in every field , but my specialization in making choles and giving pleasure to none",
        education: "Master in Flims",
        gender: "Female",
        degree: "Famous Doctor"),
    doctor(
        name: "Dr.Sameer Gedia",
        age: "37",
        address: "Availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "assets/drsamerrgedia.jpg",
        about:
            "I am all rounder in every field , but my specialization in making moles and giving pleasure to all",
        education: "Master in Flims",
        gender: "Male",
        degree: "Famous doctor"),
    doctor(
        name: "Dr.Sofiya Khanna",
        age: "33",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "assets/sofiyakhana.jpg",
        about:
            "i am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "master in adult flims",
        gender: "male",
        degree: "famous doctor"),
        doctor(
        name: "Dr.Janvi Shinde",
        age: "29",
        address: "availble on evry platform 24/7",
        time: "7 pm -10 pm",
        image:
            "assets/drjanvishinde.jpg",
        about:
            "i am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "master in adult flims",
        gender: "male",
        degree: "famous doctor"),
        doctor(
        name: "Dr.Shreeya Avsti",
        age: "41",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "assets/drshreyaavsti.jpg",
        about:
            "i am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "master in adult flims",
        gender: "Female",
        degree: "famous doctor"),
         doctor(
        name: "Dr.Raj Shergill",
        age: "41",
        address: "availble on evry platform 24/7",
        time: "11 am - 5 pm ",
        image:
            "assets/drrajshergill.jpg",
        about:
            "i am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "master in adult flims",
        gender: "male",
        degree: "famous doctor"),
  ];

  // doctorprovider(this._doctor);

  List<doctor> get orders {
    return [...doctorinfo];
  }
}
