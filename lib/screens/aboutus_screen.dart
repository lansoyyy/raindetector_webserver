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
                  color: Colors.black,
                  height: 300,
                  width: 350,
                ),
                SizedBox(
                  width: 400,
                  child: TextRegular(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
