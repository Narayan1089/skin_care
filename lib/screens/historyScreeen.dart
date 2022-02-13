import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/utils/colors.dart';

import '../provider/historyprovider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    final historydatanew=Provider.of<historyprovider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          "    History",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 25),
        ),
       actions: [IconButton(icon: Icon(Icons.search_outlined,color: white,size: 30.0,),onPressed: (){},),],
      ), 
      // body: SingleChildScrollView(
      //   physics:  ScrollPhysics(),
      //   child: Column(children: [
      //     const Padding(
      //       padding: EdgeInsets.all(30.0),
      //       child: Text(" Previous test data",style:TextStyle(color: Colors.white,fontSize: 25),),
      //     ),
      body:ListView.builder(itemCount: historydatanew.history.length,itemBuilder:(context,index){
        return  historywidgets(dieasesname: historydatanew.history[index].dieasesname,time:historydatanew.history[index].time);
      })
         
  
      
          
      );

    
  }
}

class historywidgets extends StatelessWidget {
  final String dieasesname;
  final String time;
  const historywidgets({
  required this.dieasesname,required this.time,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
    color:Colors.black,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10)
    ),
    boxShadow: [
        BoxShadow(
      color:Colors.white.withOpacity(0.1),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
        ),
    ],
        ),
        child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      
         decoration: BoxDecoration(
        color:Colors.black,
        border: Border.all(
                  color:white,
                  width: 0.05,
                ),
        ),
        child:ListTile(title: Text(dieasesname,style:TextStyle(color:white,fontSize:22),),subtitle: Text(time,style:TextStyle(color:white,fontSize:15)),trailing: Icon(Icons.check_box_outlined,color: Colors.red,size: 40,),)
     
    ),
        ),
      ),
    );
  }
}