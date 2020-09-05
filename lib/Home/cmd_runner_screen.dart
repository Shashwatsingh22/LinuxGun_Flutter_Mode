import 'package:LinuxGun/Home/ip_intro.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class CmdRunner extends StatefulWidget {
  CmdRunner({Key key}) : super(key: key);

  @override
  _CmdRunnerState createState() => _CmdRunnerState();
}

class _CmdRunnerState extends State<CmdRunner> {

  var cmdrun , ip_sys=ip;
  var webdata;
  final firebaseConnect=FirebaseFirestore.instance;

CmdRunner_web(var ip_sys,var cmd) async
{
  var url="http://${ip_sys}/cgi-bin/linux_gun.py?cmd=${cmd}";
  var response = await http.get(url);
  webdata = response.body;
  firebaseConnect.collection("User_Cmds_OutPut").add({
    "cmd":cmdrun,
    "output":webdata
  });
}

  @override
  Widget build(BuildContext context){
              return MaterialApp(
               debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Container(
                    width: double.infinity,
                    height:double.infinity,
                    decoration: BoxDecoration(
                      image : DecorationImage(
                        fit: BoxFit.fill,
                        image:AssetImage("assets/bg1.gif"))
                    ),
                  child:SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: <Widget>[
                    
                      Container(
                        width: 400,
                        height: 400,
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children:<Widget>[
                        Container(
                        width:200,
                        height:50,
                        child: 
                         Text("Your Command :",
                          style:GoogleFonts.slackey(
                           color: Color(0xDAD3D3D3),
                           fontSize: 20,
                          ),
                        ),

                      ),

                      Card(
                            color: Colors.transparent,
                            
                          child:TextField(
                           //enabled: true,
                           onChanged:(val)
                           {
                             cmdrun=val;
                           },
                           autofocus: true,
                           showCursor: true,
                           cursorWidth: 2,
                           cursorColor: Color(0xDAFFFFFF),
                           style: GoogleFonts.slackey(
                             height: 1,
                             color: Color(0xDAFFFFFF),
                             fontSize:20, 
                           ),
                           decoration: InputDecoration(
                            border:
                             OutlineInputBorder(
                              borderRadius:BorderRadius.circular(40),
                               ),
                               hintText: "Like ifconfig",
                               hintStyle: GoogleFonts.slackey(
                                 fontSize: 20,
                                 color:Color(0x60FFFFFF)
                               ),

                              ),
                        
                                                           
                         ),
                          ),
                          Card(
                            color: Colors.transparent,
                            child:
                            FlatButton(
                              onPressed: () {
                               try{
                                 CmdRunner_web(ip_sys, cmdrun);
                               }
                               catch(e)
                               {
                                 print(e);
                               }
                              },
                            child: Container(
                              width: 120,
                              height:45,
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  width:2,
                                  color:Color(0xABFFFFFF),
                                ),  
                              ),
                              child: Center (child: Text("Run",
                          style:GoogleFonts.slackey(
                           color: Color(0xDAFFFFFF),
                           fontSize: 20,
                          ),),
                            ))
                            
                          )
                          ),
                          
                          ],
                          ),),

                          Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.50,
                        color: Colors.black,
                        child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child:Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: 
                                 Row( children: <Widget>[
                              GlowingProgressIndicator(
                                    child:Text("[root@localhost ~]#",
                                  style:GoogleFonts.slackey(
                                  color: Color(0xFFFFFFFF),
                                  fontSize:15,
                                  ),
                             ),),
                             Container(
                               width: 400,
                               child:Text(" ${cmdrun ?? "..."}",
                                  style:GoogleFonts.slackey(
                                  color: Color(0xFFFFFFFF),
                                  fontSize:15,
                                  ),)
                             )
                        
                              ]),),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 2,0),
                          width: MediaQuery.of(context).size.width,
                        child: Text(webdata ?? "Output Will Come Soon !!",
                        style: TextStyle(
                          color:Color(0xA1FFFFFF),
                          fontSize:15,
                        ),
                        ),
                        
                        ),
                        
                          ],)) 
                                
                        )
                        ),
                    ],
                  ), 
                  )
                ),

              ),);
  }
  }
                  