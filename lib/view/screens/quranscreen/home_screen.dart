import 'package:adhan_dart/adhan_dart.dart';
import 'package:azkaar/view/screens/prayscreen/adan_time.dart';
import 'package:azkaar/view/widget/main_colum.dart';
import 'package:azkaar/view/widget/main_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = '/Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

double lat = 0.0;
double long = 0.0;
String address = '';
PrayerTimes? prayerTimes;

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();
  @override
  void initState() {
    super.initState();
    getLocation();
    getLonAndLat();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.21,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/jama.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                color: const Color(0xFF001654)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainRow(
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.amber,
                      size: 25.0,
                    ),
                    text: Text(
                      address,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    )),
                const SizedBox(height: 7.0),
                MainRow(
                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.amber,
                      size: 25.0,
                    ),
                    text: Text(
                      Jiffy(date).format('EEEE d/M/y'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
                const SizedBox(height: 15),
                Row(
                  children: [
                    prayerTimes == null
                        ? const Text('')
                        : Text(
                            prayerTimes!.nextPrayer().toString().toUpperCase(),
                            style: const TextStyle(
                                color: Colors.amber, fontSize: 30),
                          ),
                    const SizedBox(width: 20),
                    prayerTimes == null
                        ? const Text('')
                        : StreamBuilder(
                            stream: remainsTime(),
                            builder: (context, snapShot) {
                              return Text(
                                '(${snapShot.data})',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              );
                            },
                          ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
              child: ListView(
            children: [
              CardGrid(
                img: 'assets/quran.jpg',
                title: 'Quran',
                routeName: '/QuranScreen',
              ),
              const SizedBox(height: 10),
              CardGrid(
                img: 'assets/sebha.jpg',
                title: 'Tasbih',
                routeName: '/SebhaScreen',
              ),
              const SizedBox(height: 10),
              CardGrid(
                img: 'assets/morning.jpg',
                title: 'Athkar',
                routeName: '/AthkarScreen',
              ),
              const SizedBox(height: 10),
              CardGrid(
                img: 'assets/hadith.jpg',
                title: 'Hadith',
                routeName: '/HadithScreen',
              ),
              const SizedBox(height: 10),
              CardGrid(
                img: 'assets/qibla.jpg',
                title: 'Qibla',
                routeName: '/PerQiblaScreen',
              ),
              const SizedBox(height: 10),
              CardGrid(
                img: 'assets/pray.jpg',
                title: 'Pray Time',
                routeName: '/AdanTime',
              ),
            ],
          )),
          const SizedBox(height: 25),
        ],
      ),
    ));
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
    getPrayTime(position);
    lat = position.latitude;
    long = position.longitude;
    setState(() {});
  }

  Future getAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.street},${place.locality},${place.country}';
    setState(() {});
  }

  getPrayTime(Position position) {
    try {
      Coordinates coordinates =
          Coordinates(position.latitude, position.longitude);
      CalculationParameters params = CalculationMethod.Egyptian();
      prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
