import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rain_detector_webserver/widgets/text_widget.dart';
import 'package:latlong2/latlong.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(8.4803, 124.6498),
                  zoom: 18.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.phara_driver',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: 500,
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextBold(
                        text: '24hour Forecast',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBold(
                                  text: '60°',
                                  fontSize: 18,
                                  color: Colors.black),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                'assets/images/1.png',
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBold(
                                  text: '30°',
                                  fontSize: 18,
                                  color: Colors.black),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                'assets/images/2.png',
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBold(
                                  text: '15°',
                                  fontSize: 18,
                                  color: Colors.black),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                'assets/images/3.png',
                                width: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextRegular(
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
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
      ),
    );
  }
}
