import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drawer/controller/drawer_controller.dart';
import '../../drawer/ui/drawer_ui.dart';

// import '../../../widgets/app_bar.dart';
// import '../../../widgets/textfield.dart';
import '../../../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SideDrawerController controller = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: const AppBarWidget(),
      appBar: AppBar(
        title: Text(
          'Home Page'.tr,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              controller.updateLoginStatus();
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu)),
      ),
      drawer: NavDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: (Center(
                child: (ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    'Counter'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
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
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Login'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
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
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Users Page (Auth)'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
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
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Groups Page (No Auth)'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed("/groups");
                  },
                )),
              )),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: (Center(
                child: (ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'City Page'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed("/city");
                  },
                )),
              )),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: (Center(
                child: (ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Dashboard Page'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
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
                  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Websocket Chat'.tr,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed("/chat");
                  },
                )),
              )),
            ),
            const SizedBox(height: 16),
            CustomButton(
              platform: 'Ottawa STEM Club',
              onPressed: () {
                // Button on pressed action
              },
            ),

            // const SizedBox(height: 20),
            // const SizedBox(
            //   height: 50,
            //   child: (Center(
            //     child: (TextFieldWidget(
            //         onChange: null,
            //         ),),
            //   ),),
            // ),
          ],
        ),
      ),
    );
  }
}
