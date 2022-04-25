import 'package:azkaar/view/screens/quranscreen/home_screen.dart';
import 'package:azkaar/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class AdanTimeScreen extends StatefulWidget {
  static const String RouteName = '/AdanTime';
  const AdanTimeScreen({Key? key}) : super(key: key);

  @override
  _AdanTimeScreenState createState() => _AdanTimeScreenState();
}

List Month = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String TimePresenter(DateTime dateTime) {
  bool isGreaterThan12 = dateTime.hour > 12;
  String prefix = dateTime.hour > 11 ? 'pm' : 'am';
  int hour = isGreaterThan12 ? dateTime.hour - 12 : dateTime.hour;
  int minit = dateTime.minute;
  String hourInString = hour.toString().length == 1 ? '0$hour' : '$hour';
  String minuteInString = minit.toString().length == 1 ? '0$minit' : '$minit';
  return '$hourInString:$minuteInString  $prefix';
}

remainsTime() async* {
  yield* Stream.periodic(const Duration(seconds: 1), (t) {
    String prayer = prayerTimes!.nextPrayer();
    DateTime prayerNextTime = prayerTimes!.timeForPrayer(prayer)!.toLocal();
    DateTime now = DateTime.now();
    Duration remains = prayerNextTime.difference(now);
    return secondToHour(remains.inSeconds);
  });
}

secondToHour(int second) {
  int minutes = second ~/ 60;
  int hours = minutes ~/ 60;
  second = second - minutes * 60;
  minutes = minutes - hours * 60;
  return '$hours:$minutes:$second';
}

class _AdanTimeScreenState extends State<AdanTimeScreen> {
  DateTime date = DateTime.now();
  String lat = '';
  String long = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          return Scaffold(
            body: Column(
              children: [
                CustomAppBar(title: 'مواقيت الصلاة'),
                SizedBox(height: 25),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF0b525b),
                              Color(0xFF065a60),
                              Color(0xFF0b525b),
                            ]),
                        border: Border.all(color: Color(0xFF52b788), width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  date = date.add(const Duration(days: -1));
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.arrow_left,
                                  size: 40,
                                  color: Colors.amber,
                                ),
                              ),
                              Text(
                                '${date.day} ${Month[date.month - 1]} ${date.year}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  date = date.add(const Duration(days: 1));
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.arrow_right,
                                  size: 40,
                                  color: Colors.amber,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            prayerTimes!.nextPrayer().toString().toUpperCase(),
                            style: const TextStyle(
                                color: Color(0xFF1388eb), fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          StreamBuilder(
                            stream: remainsTime(),
                            builder: (context, snapShot) {
                              return Text(
                                '${snapShot.data}',
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 20),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    WaktoButton(
                      Side.right,
                      height,
                      width,
                      'الفجر',
                      TimePresenter(prayerTimes!.fajr!.toLocal()),
                      true,
                    ),
                    WaktoButton(
                      Side.left,
                      height,
                      width,
                      'الشروق',
                      TimePresenter(prayerTimes!.sunrise!.toLocal()),
                      false,
                    ),
                    WaktoButton(
                      Side.right,
                      height,
                      width,
                      'الضهر',
                      TimePresenter(prayerTimes!.dhuhr!.toLocal()),
                      true,
                    ),
                    WaktoButton(
                      Side.left,
                      height,
                      width,
                      'العصر',
                      TimePresenter(prayerTimes!.asr!.toLocal()),
                      true,
                    ),
                    WaktoButton(
                      Side.right,
                      height,
                      width,
                      'المغرب',
                      TimePresenter(prayerTimes!.maghrib!.toLocal()),
                      true,
                    ),
                    WaktoButton(
                      Side.left,
                      height,
                      width,
                      "العشاء",
                      TimePresenter(prayerTimes!.isha!.toLocal()),
                      true,
                    ),
                  ],
                )),
                SizedBox(height: 25),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum Side { left, right }

class WaktoButton extends StatelessWidget {
  final Side side;
  final double height;
  final double width;
  final String wktoName;
  final String wktoTime;
  final bool isAlarmOn;

  WaktoButton(
    this.side,
    this.height,
    this.width,
    this.wktoName,
    this.wktoTime,
    this.isAlarmOn,
  );

  @override
  Widget build(BuildContext context) {
    final icon = Container(
      height: height * 0.06,
      width: width * 0.09,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
      child: SizedBox(
        height: height * 0.06,
        width: width * 0.09,
        child: Image.asset(
            isAlarmOn ? 'assets/alarmOn.png' : 'assets/alarmOFF.png'),
      ),
    );
    final wakto = Text(
      wktoName,
      style: const TextStyle(color: Colors.amber, fontSize: 25),
    );
    final time = Text(
      wktoTime,
      style: const TextStyle(color: Colors.white, fontSize: 25),
    );
    return Row(
      children: [
        side == Side.left
            ? Container(
                height: height * 0.08,
                width: width * 0.95,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0b525b),
                          Color(0xFF065a60),
                          Color(0xFF0b525b),
                        ]),
                    border: Border.all(color: Color(0xFF52b788), width: 2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [icon, time, wakto],
                ),
              )
            : Spacer(),
        side == Side.right
            ? Container(
                height: height * 0.08,
                width: width * 0.95,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0b525b),
                          Color(0xFF065a60),
                          Color(0xFF0b525b),
                        ]),
                    border: Border.all(color: Color(0xFF52b788), width: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [icon, time, wakto],
                ),
              )
            : Spacer()
      ],
    );
  }
}
