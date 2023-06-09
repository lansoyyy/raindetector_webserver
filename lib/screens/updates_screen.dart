import 'package:flutter/material.dart';
import 'package:rain_detector_webserver/widgets/text_widget.dart';

import '../utils/routes.dart';

class WeatherUpdatesScreen extends StatefulWidget {
  const WeatherUpdatesScreen({super.key});

  @override
  State<WeatherUpdatesScreen> createState() => _WeatherUpdatesScreenState();
}

class _WeatherUpdatesScreenState extends State<WeatherUpdatesScreen> {
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
          Center(
            child: TextBold(
              text: 'Live Weather Updates',
              fontSize: 48,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            height: 400,
            width: 800,
            child: Center(
              child: Container(
                height: 50,
                width: 600,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: messageController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: filter != ''
                        ? IconButton(
                            onPressed: (() {
                              setState(() {
                                filter = '';
                                messageController.clear();
                              });
                            }),
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                          )
                        : const SizedBox(),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintText: 'Find Location',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      filter = value;
                    });
                  },
                ),
              ),
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