import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("Technect",style: GoogleFonts.montserrat(
          color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
