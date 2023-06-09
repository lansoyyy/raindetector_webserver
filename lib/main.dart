import 'package:flutter/material.dart';
import 'package:rain_detector_webserver/screens/aboutus_screen.dart';
import 'package:rain_detector_webserver/screens/contactus_screen.dart';
import 'package:rain_detector_webserver/screens/home_screen.dart';
import 'package:rain_detector_webserver/screens/updates_screen.dart';
import 'package:rain_detector_webserver/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        Routes.homepage: (context) => const HomeScreen(),
        Routes.aboutuspage: (context) => const AboutusScreen(),
        Routes.contactuspage: (context) => const ContactUsScreen(),
        Routes.updatespage: (context) => const WeatherUpdatesScreen(),
      },
    );
  }
}
