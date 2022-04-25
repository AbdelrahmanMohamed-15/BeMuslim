import 'package:azkaar/provider/sebha_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  static const String RouteName = '/SebhaScreen';
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int initial = 0;
  PageController pc = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: initial);
  }

  @override
  Widget build(BuildContext context) {
    int count = 33;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF2d6a4f),
            appBar: AppBar(
              backgroundColor: Color(0xFF2d6a4f),
              centerTitle: true,
              title: const Text(
                "Sebha",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
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
            body: Consumer<SebhaProvider>(builder: (context, sebha, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/seb.png'),
                      SizedBox(width: 10),
                      Text(
                        'Total Today Tasbih : ${sebha.total}',
                        style: TextStyle(fontSize: 20, color: Colors.amber),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Expanded(
                        child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          initial = value;
                        });
                      },
                      children: [
                        buildContainer('سبحان الله', sebha.count1, context),
                        buildContainer('الحمدلله', sebha.count2, context),
                        buildContainer('الله أكبر', sebha.count3, context),
                        buildContainer(
                            'لا اله الا الله', sebha.count4, context),
                        buildContainer(
                            'حسبي الله ونعم الوكيل', sebha.count5, context),
                        buildContainer(
                            'أستغفر الله وأتوب اليه', sebha.count6, context),
                        buildContainer(
                            'لا حول ولا قوة الا بالله', sebha.count7, context),
                        buildContainer('سبحان الله وبحمده ، سبحان الله العظيم',
                            sebha.count8, context),
                      ],
                    )),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (initial == 0) {
                          sebha.increment('سبحان الله');
                        } else if (initial == 1) {
                          sebha.increment('الحمدلله');
                        } else if (initial == 2) {
                          sebha.increment('الله أكبر');
                        } else if (initial == 3) {
                          sebha.increment('لا اله الا الله');
                        } else if (initial == 4) {
                          sebha.increment('حسبي الله ونعم الوكيل');
                        } else if (initial == 5) {
                          sebha.increment('أستغفر الله وأتوب اليه');
                        } else if (initial == 6) {
                          sebha.increment('لا حول ولا قوة الا بالله');
                        } else if (initial == 7) {
                          sebha.increment(
                              'سبحان الله وبحمده ، سبحان الله العظيم');
                        }
                      },
                      child: Container(
                        height: 95,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF081c15),
                            border: Border.all(width: 2, color: Colors.amber)),
                        child: Center(
                          child: Text(
                            '${initial == 0 ? sebha.first1 : initial == 1 ? sebha.first2 : initial == 2 ? sebha.first3 : initial == 3 ? sebha.first4 : initial == 4 ? sebha.first5 : initial == 5 ? sebha.first6 : initial == 6 ? sebha.first7 : sebha.first7} / ${count}',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            })));
  }

  Widget buildContainer(String text, int count, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF2d6a4f),
            Color(0xFF40916c),
            Color(0xFF2d6a4f),
          ]),
          border: Border.all(color: Color(0xFF081c15), width: 2),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.amber, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/seb.png'),
              SizedBox(width: 10),
              Text(
                '${count}',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              )
            ],
          ),
        ],
      ),
    );
  }
}
