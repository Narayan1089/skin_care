import 'package:flutter/material.dart';
import 'package:skin_care/utils/colors.dart';

class Doctorinfo extends StatelessWidget {
  const Doctorinfo({ Key? key }) : super(key: key);

  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(elevation: 1,
        shadowColor: Colors.grey,backgroundColor: mobileBackgroundColor,title: Text('Details',style:TextStyle(color: white,fontSize: 25,fontWeight: FontWeight.bold),),),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
        Padding(
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
          color:Colors.black.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(

       decoration: BoxDecoration(
      color:Colors.black,
      border: Border.all(
                      color:white,
                      width: 0.2,
                    ),
      ),
      child:Row(children: [ Padding(
        padding: const EdgeInsets.only(left:15.0),
        child: Container( decoration:BoxDecoration( borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),),
            color: Colors.white, border: Border.all(
                      color:white,
                      width: 0.1,
                    ),
      ),
    height:MediaQuery.of(context).size.height*0.08,width:MediaQuery.of(context).size.height*0.09,child: Image.asset('assets/logan.jpg', height:MediaQuery.of(context).size.height*0.08,width:MediaQuery.of(context).size.height*0.09),),
      ),SizedBox(width: 20,),Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Dr.Folrester france',style: TextStyle(fontSize:20),),SizedBox(height:3),Text("male 27 age",style: TextStyle(color:Colors.grey),)],)],)
     
    ),
  ),
),
        ),

        Padding(
          padding: const EdgeInsets.only(left:25.0,bottom: 10,),
          child: Text("appointment info",style: TextStyle(color: Colors.blueGrey,fontSize: 20,),),
        ),
         appoinmentinfo(color2:Color.fromARGB(255, 223, 204, 226),color:Colors.purple,icon:Icons.person,title: "MBBS",),
         appoinmentinfo(color2:Color.fromARGB(255, 194, 204, 211),color:Colors.blue,icon:Icons.attribution_outlined,title: "Goregaon 65,mumbai -65",),
          appoinmentinfo(color2:Color.fromARGB(255, 223, 204, 226),color:Colors.purple,icon:Icons.timer,title: "8 Am-8 PM",),
         Padding(
          padding: const EdgeInsets.only(top:20,left:25.0,bottom: 10,),
          child: Text("about",style: TextStyle(color: Colors.blueGrey,fontSize: 20,),),
        ),

        Padding(
          padding: const EdgeInsets.only(left:20,right:20,bottom: 20,),
          child: Text("slhkifgopiue rgiyergopewrug peg poeuwrtgpoiuewsr gopeiwurg weropg ierywg pywerpoigy epworyg erigy ewrygpweygp wego werpgy wpeorgpewpg wepiry g  ewrtoyer t  retiopyewrtiy ",style: TextStyle(fontSize: 17),),

        ),
        SizedBox(height: 100,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7)),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Schedule',
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
                        child: Text('Decline',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            )),
                        color: Colors.white,
                      ),
            ),  ],),
        )
      ],
    ),);
  }
}

class appoinmentinfo extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;

  final Color color2;
  const appoinmentinfo({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
    required this.color2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0),
      child: Container(
      child: ListTile(
        leading: CircleAvatar(
       backgroundColor: color2,
       child: Icon(
        icon,
         color:color,
       ),
        ),
        title: Text(title,
         style: TextStyle(
           fontSize: 17,
         )),
      
        // trailing: Container(
        //   width: 70,
        //   height: 30,
        //   decoration: BoxDecoration(
        //       color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        //   child: Center(
        //     child: Text(
        //       'Now',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 15,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      ),
    );
  }
}