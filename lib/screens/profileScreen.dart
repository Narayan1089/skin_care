import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1,
        shadowColor: Colors.grey,backgroundColor: mobileBackgroundColor,actions: [Center(child: Text("save",style: TextStyle(fontSize: 18,color: Colors.green[400]),))],title: Center(child: Text('Profile',style:TextStyle(color: white,fontSize: 25,fontWeight: FontWeight.bold),),)),
      body: Column(children: [Padding(
        padding: const EdgeInsets.only(top:50),
        child: Center(child: CircleAvatar(child: Icon(Icons.safety_divider_rounded),radius:70,backgroundColor: white,)),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person,color: Colors.grey,size:30,),
          ),Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Name",style: TextStyle(fontSize: 12,color: Colors.grey),),SizedBox(height:2,),Text("Tushar Gharge",style: TextStyle(color:white,fontSize:18),),],),Icon(Icons.edit,color:Colors.green[400],),],),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.info_outline,color: Colors.grey,size: 30,),
          ),Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("about",style: TextStyle(fontSize: 12,color: Colors.grey),),SizedBox(height:2,),Text("Strong AF",style: TextStyle(color:white,fontSize:18),),],),Icon(Icons.edit,color:Colors.green[400],),],),
        ),
      ),Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person,color: Colors.grey,size: 30,),
          ),Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("contact",style: TextStyle(fontSize: 12,color: Colors.grey),),SizedBox(height:2,),Text("+9167090343",style: TextStyle(color:white,fontSize:18),),],),Icon(Icons.edit,color:Colors.green[400],),],),
        ),
      )
      ],),
    );
    
  }
}