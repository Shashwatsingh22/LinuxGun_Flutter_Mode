import 'package:flutter/material.dart';
import 'package:LinuxGun/Home/ip_intro.dart';
import 'package:LinuxGun/Home/splash_screen.dart';
import 'package:LinuxGun/Home/cmd_runner_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

 runApp(MaterialApp(
 initialRoute: "/linuxgunintro",
 routes :{
  "/linuxgunintro": (context) => LinuxGunIntro(),
  "/ip_intro": (BuildContext context) => IP_Intro(),
  "/cmd_runner":(BuildContext context)=>CmdRunner(),
 },
 debugShowCheckedModeBanner: false,
 )
 );
}
