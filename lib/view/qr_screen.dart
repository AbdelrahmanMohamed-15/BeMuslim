import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  static const String RouteName = '/QrScreen';
  const QrScreen({Key? key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final TextEditingController _editingController =
      TextEditingController(text: 'Qr');
  String data = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Generate QR Code'),
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10)),
                    controller: _editingController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          data = _editingController.text;
                        });
                      },
                      child: const Text('Generate QR')),
                  SizedBox(height: 20),
                  Center(
                    child: QrImage(
                      data: data,
                      version: QrVersions.auto,
                      size: 250,
                    ),
                  )
                ],
              ),
            )));
  }
}
