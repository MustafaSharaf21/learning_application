import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learning_application/widgets/constants.dart';
class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({super.key});
  @override  //khjhjhjhhh
  State<HomePage> createState() => _HomeState();}
class _HomeState extends State<HomePage> {
  int selectedIndex=0;
  List categories =["All","courses","E","S"];
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Kcolor,
        actions:const  [
          Padding(padding:  EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundColor: Colors.white,
            child: Text("E"),
                   ),
                ),
             ],
           ),     // backgroundColor: Color(0xFFDBBEE0),
       backgroundColor: Colors.white,
       body:Column(
         children: [
            const SizedBox(height: 25,),
            Container(
                height:150,
                width: 300,
              decoration:const BoxDecoration(
               image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/login_image.jpg')
                ),
              )
                    ),

               const SizedBox(height: 25,),
               Container(
               margin:const  EdgeInsets.symmetric(horizontal: 20 /2),
                  height: 30,
                  child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder:(context,index)=>GestureDetector(
                                   onTap: (){
                                     setState(() {
                                selectedIndex=index;
                                     });
                                    },
                        child: Container(
                              alignment: Alignment.center,
                              margin:EdgeInsets.only(left:20,
                              right: index==categories.length -1 ?20:0),
                              padding:const  EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                              color: index==selectedIndex?Colors.white.withOpacity(0.4):const Color(0xFFC68FCE),
                              borderRadius: BorderRadius.circular(6),
                              ),
                        child: Text(
                          categories[index],
                          style:const  TextStyle(
                              color: Colors.black
                              ),
                          ),
                         ),
                       ) ,
                   ),
                ),
           Expanded(child: Container(
                    decoration:const  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),topLeft:Radius.circular(40) ),
                             ),
                           )
                          )
                       ],
                    ),
                bottomNavigationBar: CurvedNavigationBar(
                                          color: Color(0xFFC68FCE),
                                          backgroundColor: Colors.white,
                                          items:const [
                                        Icon(Icons.home,size: 30,color:Colors.white),
                                        Icon(Icons.favorite,size: 30,color:Colors.white),
                                        Icon(Icons.local_library_outlined,size: 30,color:Colors.white),
                                        Icon(Icons.search,size: 30,color:Colors.white)
                                                      ],
      ),
    );
  }
}
/*trjhkjhjdjpjfgs*/