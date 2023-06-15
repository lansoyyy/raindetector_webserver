import 'package:flutter/material.dart';
import 'package:rain_detector_webserver/widgets/text_widget.dart';

import '../utils/routes.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.aboutuspage);
                  },
                  child: TextRegular(
                    text: 'About Us',
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
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      text: 'Contact Us',
                      fontSize: 48,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextRegular(
                        text:
                            'We would love to hear from you! If you have any inquiries or would like to learn more about our rain detection systems using microcontrollers, please dont hesitate to get in touch with us.\n\nPhone: +639530422231\nEmail: raindetector@gmail.com\n\nOur dedicated team is available to answer your questions, provide technical support, and discuss customized solutions to meet your specific rain detection needs. Feel free to reach out to us and let us assist you in optimizing your weather monitoring and protection systems.',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
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
          ),
        ],
      ),
    );
  }
}
