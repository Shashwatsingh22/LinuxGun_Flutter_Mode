import 'dart:async';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:LinuxGun/Navigator/navigate.dart';

class LinuxGunIntro extends StatefulWidget {
  @override
  _LinuxGunIntroState createState() => _LinuxGunIntroState();
}

class _LinuxGunIntroState extends State<LinuxGunIntro> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:7), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
               body :
               Container(
                 width: double.infinity,
                 height: double.infinity,
                 color: Color(0xDA000000),
                  
                  child: 
                    Stack( 
                      
                      children:<Widget>[
                      Center(child: Container(
                         width:200,
                         height:400,
                         decoration: BoxDecoration(
                     image: DecorationImage(
                     image:AssetImage("assets/linux.gif"), 
                   )
                  ),
                       ),),

                      Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      FadingText('LinuxGun Loading...',
                      style: TextStyle(
                        color: Color(0xDAFFFFFF),
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                      JumpingDotsProgressIndicator(
                                  fontSize: 40.0,
                                  numberOfDots: 5,
                                  color: Color(0xDAFFFFFF),
                                )
                       
                         ],
                  ),
                    ],
               ),
               ),
               );
    }
}