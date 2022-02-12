
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(194, 6, 78, 133),
    body: Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
     
      Padding(
        padding: EdgeInsets.only(top:70.0,left:30),
        child: Text("Take Test " ,style: TextStyle(color: white,fontSize: 40,fontWeight: FontWeight.bold),),
      ),
      Center(child: Container(child:SvgPicture.asset("assets/svgc.svg"),height:MediaQuery.of(context).size.height*0.6,width:MediaQuery.of(context).size.width*0.8,),),
    Padding(
          padding: const EdgeInsets.only(left:35.0,top:25,),
          child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7)),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Take Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Choose from Gallary',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            )),
                        color: Colors.white,
                      ),
            ),  ],),
        )
    ]),
    );
    
  }
}