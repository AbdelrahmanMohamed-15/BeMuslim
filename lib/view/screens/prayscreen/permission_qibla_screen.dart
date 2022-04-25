import 'package:azkaar/view/screens/prayscreen/qibla_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class PerScreen extends StatefulWidget {
  static const String RouteName = '/PerQiblaScreen';
  const PerScreen({Key? key}) : super(key: key);

  @override
  _PerScreenState createState() => _PerScreenState();
}

class _PerScreenState extends State<PerScreen> {
  Location location = Location();

  Future<PermissionStatus> checkPermission() async {
    return await location.hasPermission();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<PermissionStatus>(
          future: checkPermission(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == PermissionStatus.granted) {
                return const QiblaScreen();
              } else {
                return Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      location.requestPermission();
                      setState(() {});
                    },
                    child: const Text('Need Permission'),
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
