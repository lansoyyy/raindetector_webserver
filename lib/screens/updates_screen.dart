import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rain_detector_webserver/utils/const.dart';
import 'package:rain_detector_webserver/widgets/text_widget.dart';
import 'package:latlong2/latlong.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class WeatherUpdatesScreen extends StatefulWidget {
  const WeatherUpdatesScreen({super.key});

  @override
  State<WeatherUpdatesScreen> createState() => _WeatherUpdatesScreenState();
}

class _WeatherUpdatesScreenState extends State<WeatherUpdatesScreen> {
  final messageController = TextEditingController();

  String filter = '';
  String description = '';
  String temperature = '0';
  String cloud1 = '0';
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
                  onTap: (tapPosition, point) {
                    getApiData(point.latitude, point.longitude);
                  },
                  center: LatLng(8.4803, 124.6498),
                  zoom: 18.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                                  text: temperature,
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
                                  text: cloud1,
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
                          text: 'Weather Description:\n$description',
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

  getApiData(lat, long) async {
    var uri =
        '$apiEnpoint?lat=$lat&lon=$long&appid=67a96ca939095cc12748c226c7d3851c';
    try {
      var response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        // Request was successful
        var data = json.decode(response.body);
        var weatherDescription = data['weather'][0]['description'];
        var temperatureKelvin = data['main']['temp'];
        var temperatureCelsius =
            temperatureKelvin - 273.15; // Convert from Kelvin to Celsius
        var cloud = data['clouds']['all'];

        var name = data['name'];

        print('Weather Description: $weatherDescription');
        print('Temperature: ${temperatureCelsius.toStringAsFixed(2)}°C');
        print('Cloud: $cloud');

        print('Location: $name');

        setState(() {
          temperature = '${temperatureCelsius.toStringAsFixed(2)}°C';
          cloud1 = '$cloud%';
          description = '$weatherDescription';
        });

        // Suggest crops based on weather conditions

        // Show success snackbar
        // showSnackbar('Request successful');
      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}');

        // Show error snackbar
        // showSnackbar('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred
      print('Error: $e');

      // Show error snackbar
      // showSnackbar('An error occurred');
    }
  }
}
