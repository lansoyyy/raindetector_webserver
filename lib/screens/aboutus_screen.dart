import 'package:flutter/material.dart';
import 'package:rain_detector_webserver/widgets/text_widget.dart';

import '../utils/routes.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  final messageController = TextEditingController();

  String filter = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.homepage);
                  },
                  child: TextRegular(
                    text: 'Home',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: TextRegular(
                    text: 'Live Weather Updates',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: TextBold(
              text: 'About Us',
              fontSize: 48,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/engi.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 300,
                  width: 350,
                ),
                SizedBox(
                  width: 400,
                  child: TextRegular(
                    text:
                        'Our team of skilled engineers and scientists specialize in developing rain detection systems using microcontrollers, ensuring precise and reliable rainfall measurements for enhanced safety and resource management.',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 50,
          )),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.contactuspage);
                  },
                  child: TextRegular(
                    text: 'Need Help? Contact Us',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
