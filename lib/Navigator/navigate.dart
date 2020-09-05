import 'package:flutter/material.dart';

class MyNavigator {
  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/linuxgunintro");
  }

  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context,"/ip_intro");
  } 

   static void goToCmdRunner(BuildContext context) {
    Navigator.pushNamed(context,"/cmd_runner");
  }
}