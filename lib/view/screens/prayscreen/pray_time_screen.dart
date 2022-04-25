import 'dart:convert';

import 'package:azkaar/http_helper.dart/http_helper.dart';
import 'package:azkaar/models/adan_models/adan_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class PrayScreen extends StatefulWidget {
  static const String RouteName = '/PrayTime';
  const PrayScreen({Key? key}) : super(key: key);

  @override
  _PrayScreenState createState() => _PrayScreenState();
}

class _PrayScreenState extends State<PrayScreen> {
  DateTime date = DateTime.now();
  String address = '';
  Map prayTime = {};
  String keys = '';

  @override
  void initState() {
    super.initState();
    getLocation();
    getLonAndLat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF00061a),
              centerTitle: true,
              title: const Text(
                'Prayer Time',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.amber),
              ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF00061a),
                  ),
                ),
              ),
            ),
            body: ListView(
              children: [
                buildRow('Fajr', '${prayTime['Fajr']}'),
                buildRow('Sunrise', '${prayTime['Sunrise']}'),
                buildRow('Dhuhr', '${prayTime['Dhuhr']}'),
                buildRow('Asr', '${prayTime['Asr']}'),
                buildRow('Sunset', '${prayTime['Sunset']}'),
                buildRow('Maghrib', '${prayTime['Maghrib']}'),
                buildRow('Isha', '${prayTime['Isha']}'),
              ],
            )));
  }

  Future<Position> getLocation() async {
    bool service;
    LocationPermission permission;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false) {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future getLonAndLat() async {
    Position position = await getLocation();
    getAddress(position);
    setState(() {});
  }

  Future getAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.street},${place.subLocality},${place.locality}';
    fetchData(address);
  }

  fetchData(String address) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByAddress?address=$address'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        prayTime = data['data']['timings'];
      });
    } else {
      print(response.statusCode);
    }
  }

  Widget buildRow(String prayName, String time) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber),
              child: Center(
                child: Text(
                  prayName,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00061a)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF00061a)),
              child: Center(
                child: Text(
                  time,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
