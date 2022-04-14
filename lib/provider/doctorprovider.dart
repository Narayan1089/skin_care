import 'package:flutter/cupertino.dart';
import 'package:skin_care/provider/doctor.dart';

class doctorprovider with ChangeNotifier {
  final List<doctor> doctorinfo = [
    doctor(
        name: "Dr. Seema Limbachiya",
        age: "53",
        address: "12, GeetanjaliPur,mumbai - 400021",
        time: "9 am - 2 pm ",
        image: "assets/seemalemachiya.jpg",
        about:
            "I am Dr. Seema Limbachiya,completed my eduction of dermatology and have experience of 5 years in KEM Hosptial.",
        education: "Bachelor in Dermatology",
        gender: "Male",
        degree: "Bachelor in Dermatology"),
    doctor(
        name: "Dr. Sana Shah",
        age: "38",
        address:
            "12, Shreeji Nagar, Chanukarwadi Road, Kandivali (west),400067",
        time: "8 pm -11 pm",
        image: "assets/sanashah.jpg",
        about:
            "I am Dr. Sana shah,completed my eduction of dermatology and have experience of 8 years in Tata Hosptial.",
        education: "Medical's in  Dermatology",
        gender: "Male",
        degree: "MBBS in Lesions"),
    doctor(
        name: "Dr. Allen paul",
        age: "31",
        address: "551/16., Phrd, Arumbakkam ,Chennai, Tamil Nadu, 600106",
        time: "12.45 pm  -2 pm ",
        image: "assets/allenpaul.jpg",
        about:
            "I am Dr. Allen paul,completed my eduction of dermatology and have experience of 2 years in seema Hosptial.",
        education: "Bachelor in Dermatology",
        gender: "Male",
        degree: "MS in Skin Surgery"),
    doctor(
        name: "Dr. Anurekh Yadhav",
        age: "37",
        address:
            "Bansilal Building, 64-d Girgaum Road, Girgaum,Mumbai, Maharashtra, 400004",
        time: "3 pm  - 5 pm",
        image: "assets/ankurekhyadhav.jpg",
        about:
            "I am Dr. Anurekh Yadhav ,completed my eduction of dermatology and have experience of 9 years in JJ Hosptial.",
        education: "Medical's in  Dermatology",
        gender: "Male",
        degree: "Skin Specialist"),
    doctor(
        name: "Dr. Tapsi Raj",
        age: "31",
        address: "D 1, Main Vikas Marg Delhi, Delhi, 110092",
        time: "4 pm - 8 pm ",
        image: "assets/tapasiraj.jpg",
        about:
            "I am Dr. Tapsi Raj ,completed my eduction of dermatology and have experience of 2.5 years.",
        education: "Philosophy in Dermatology ",
        gender: "Female",
        degree: "Melanoma Specialist"),
    doctor(
        name: "Dr. Sameer Gedia",
        age: "37",
        address: "Manoranjan Cplx, Nampally Hyderabad, Andhra Pradesh, 500001",
        time: "12 noon -12 noon",
        image: "assets/drsamerrgedia.jpg",
        about:
            "I am dr. Sameer Gadia ,completed my eduction of dermatology and have experience of 6 years .",
        education: "Bachelor in Dermatology",
        gender: "Male",
        degree: "Bachelor in Dermatology"),
    doctor(
        name: "Dr. Sofiya Khanna",
        age: "33",
        address: "3-5-142/d, King Koti Hyderabad, Andhra Pradesh, 500001",
        time: "10 am - 1 pm ",
        image: "assets/sofiyakhana.jpg",
        about:
            "I am dr. Sofiya Khana ,completed my eduction of dermatology and have experience of 3 years .",
        education: "Bachelor in Dermatology",
        gender: "male",
        degree: "Bachelor in Dermatology"),
    doctor(
        name: "Dr. Janvi Shinde",
        age: "29",
        address:
            "2, Shree Ram Indl, Nr Shalimar Indl Est, Matunga(c.r) Mumbai, Maharashtra, 400019",
        time: "7 pm -10 pm",
        image: "assets/drjanvishinde.jpg",
        about:
            "I am dr. Janvi Shinde ,completed my eduction of dermatology and have experience of 2.5 years.",
        education: "Philosophy in Dermatology",
        gender: "male",
        degree: "Philosophy in Dermatology"),
    doctor(
        name: "Dr.Shreeya Avsti",
        age: "41",
        address: "5 Homji Street Mumbai, Maharashtra, 400001",
        time: "8 am -10 pm ",
        image: "assets/drshreyaavsti.jpg",
        about:
            "I am dr. Shreeya Avsti ,completed my eduction of dermatology and have experience of 9 years.",
        education: "medical's in  Dermatology",
        gender: "Female",
        degree: "medical's in  Dermatology"),
    doctor(
        name: "Dr.Raj Shergill",
        age: "41",
        address:
            "3 Hargun House, 148-a A Besant Rd, Worli Mumbai, Maharashtra, 400018 ",
        time: "11 am - 5 pm ",
        image: "assets/drrajshergill.jpg",
        about:
            "I am dr. Raj Shergill ,completed my eduction of dermatology and have experience of 9 years.",
        education: "Philosophy in Dermatology",
        gender: "male",
        degree: "Philosophy in Dermatology"),
  ];

  // doctorprovider(this._doctor);

  List<doctor> get orders {
    return [...doctorinfo];
  }
}
