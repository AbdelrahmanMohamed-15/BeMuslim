import 'dart:math';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:azkaar/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';

class QiblaScreen extends StatefulWidget {
  static const String RouteName = '/QiblaScreen';
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  _QiblaScreenState createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  String address = '';
  late PrayerTimes prayerTimes;
  DateTime date = DateTime.now();
  Location location = Location();
  late Stream<LocationData> locationData;

  @override
  void initState() {
    super.initState();
    locationData = location.onLocationChanged;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        return StreamBuilder<LocationData>(
            stream: locationData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Coordinates coordinates = Coordinates(
                    snapshot.data!.latitude, snapshot.data!.longitude);
                double degree = Qibla.qibla(coordinates);
                double qibla = degree * (pi / 180);
                return Scaffold(
                  backgroundColor: Color(0xFF065a60),
                  body: Column(
                    children: [
                      CustomAppBar(title: 'اتجاه القبلة'),
                      SizedBox(height: 15),
                      Expanded(
                          child: StreamBuilder<CompassEvent>(
                              stream: FlutterCompass.events,
                              builder: (context, snapshot2) {
                                if (snapshot2.hasData) {
                                  double compass =
                                      -snapshot2.data!.heading! * (pi / 180);
                                  return Transform.rotate(
                                      angle: compass,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15),
                                        child: Center(
                                          child: SizedBox(
                                            height: width,
                                            width: width,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  'assets/compasspn.png',
                                                  height: width,
                                                  width: width,
                                                ),
                                                Transform.rotate(
                                                  angle: qibla,
                                                  child: Image.asset(
                                                    'assets/ctest.png',
                                                    height: width,
                                                    width: width,
                                                    alignment: Alignment.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }))
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            });
      },
    ));
  }
}
