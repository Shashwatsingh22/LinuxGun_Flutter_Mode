import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:LinuxGun/Navigator/navigate.dart';

String ip="192.168.43.172";

class IP_Intro extends StatefulWidget {
  @override
  IP_IntroState createState() {
    return IP_IntroState();
  }
}

class IP_IntroState extends State<IP_Intro> {
  @override
Widget build(BuildContext context)
  {
  return MaterialApp(
                 debugShowCheckedModeBanner: false,
                 home: Scaffold(
                   body:
                   Container(
                    width: double.infinity,
                    height: double.infinity,
                    
                    decoration:BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage("assets/bg1.gif"))
                          ,),
                    child: Center( child:
                    Container(
                      width:350,
                      height:250,
                      
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width:2,
                          color:Color(0xABFFFFFF),

                        )
                      ),
                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                          margin: EdgeInsets.all(20),
                          child:Text("Enter Your System IP.....",
                          style:GoogleFonts.slackey(
                           color: Color(0xDAFFFFFF),
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
                             ip=val;
                           },
                           autofocus: true,
                           showCursor: true,
                           cursorWidth: 4,
                           cursorColor: Color(0xDAFFFFFF),
                           style: GoogleFonts.slackey(
                             height: 2,
                             color: Color(0xDAFFFFFF),
                             fontSize:20, 
                           ),
                           decoration: InputDecoration(
                            border:
                             OutlineInputBorder(
                              borderRadius:BorderRadius.circular(40),  
                               ),
                               hintText: "192.168.0.100",
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
                              onPressed: () => MyNavigator.goToCmdRunner(context),
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
                              child: Center (child: Text("Submit",
                          style:GoogleFonts.slackey(
                           color: Color(0xDAFFFFFF),
                           fontSize: 20,
                          ),),
                            ))
                            
                          )
                          ),
                        ],

                        
                      ),
                    )
                    )
                   ),
                 ),
  );
  }}