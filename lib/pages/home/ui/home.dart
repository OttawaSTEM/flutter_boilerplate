import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/drawer/ui/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page'.tr,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Counter'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/counter");
                },
              )),
            )),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Sign in'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/signin");
                },
              )),
            )),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Users List Page'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/users");
                },
              )),
            )),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Groups Page'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/groups");
                },
              )),
            )),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Dashboard Page'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/dashboard");
                },
              )),
            )),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: (Center(
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Websocket Chat'.tr,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/chat");
                },
              )),
            )),
          ),
        ],
      ),
    );
  }
}
