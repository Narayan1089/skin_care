import 'package:flutter/cupertino.dart';
import 'package:skin_care/provider/doctor.dart';

class doctorprovider with ChangeNotifier {
  final List<doctor> doctorinfo = [
    doctor(
        name: "Dr. Tushar Sins",
        age: "21",
        address: "Availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "https://media-exp1.licdn.com/dms/image/C4E03AQG3kndXYZ60rQ/profile-displayphoto-shrink_200_200/0/1608647045965?e=1645056000&v=beta&t=JZarQny0j_Z39fuAc5SfoVv-uOQ2e7-8mbpmGBIdMPc",
        about:
            "I am all rounder in every field , but my specialization in making poles and giving pleasure to all",
        education: "Master of ChingChong",
        gender: "Male",
        degree: "B.E in Linkedin"),
    doctor(
        name: "Dr. Krutik Rose",
        age: "21",
        address: "Availble on Hornhub",
        time: "9 pm -12 noon",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDrX9u_JEwragJNTiSLKy08trlzFliA9imhw&usqp=CAU",
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
            "https://yt3.ggpht.com/ytc/AKedOLSWSLDvOcSzYmVZ96acBhraKfpk-3wWUtmdKBhXBb4=s900-c-k-c0x00ffffff-no-rj",
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
            "https://pbs.twimg.com/profile_images/1271059684858843137/7FeblAtV_400x400.jpg",
        about:
            "I am all rounder in every field , but my specialization in making holes and giving pleasure to women",
        education: "Master in Dane",
        gender: "Male",
        degree: "WhatsApp University"),
    doctor(
        name: "Dr.Jonney sins",
        age: "31",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "https://pbs.twimg.com/profile_images/1243806677608083456/dgTUsgBf_400x400.jpg",
        about:
            "I am all rounder in every field , but my specialization in making choles and giving pleasure to none",
        education: "Master in Flims",
        gender: "Male",
        degree: "Famous Doctor"),
    doctor(
        name: "Dr.Jonney sins",
        age: "31",
        address: "Availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "https://pbs.twimg.com/profile_images/1243806677608083456/dgTUsgBf_400x400.jpg",
        about:
            "I am all rounder in every field , but my specialization in making moles and giving pleasure to all",
        education: "Master in Flims",
        gender: "Male",
        degree: "Famous doctor"),
    doctor(
        name: "Dr.Jonney sins",
        age: "31",
        address: "availble on evry platform 24/7",
        time: "12 noon -12 noon",
        image:
            "https://pbs.twimg.com/profile_images/1243806677608083456/dgTUsgBf_400x400.jpg",
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
