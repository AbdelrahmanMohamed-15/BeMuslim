import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuranPageScreen extends StatefulWidget {
  static const String RouteName = '/QuranPage';
  int page;
  QuranPageScreen({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  _QuranPageScreenState createState() => _QuranPageScreenState();
}

class _QuranPageScreenState extends State<QuranPageScreen> {
  PageController pc = PageController();

  @override
  void initState() {
    super.initState();
    pc = new PageController(initialPage: widget.page - 1);
  }

  @override
  Widget build(BuildContext context) {
    List tot = [1, 604];
    List page = [];
    for (int i = tot.first; i <= tot.last; i++) {
      page.add(i);
    }
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFfdffb6),
              Color(0xFFfdffb6),
              Color(0xFFfdffb6),
            ]),
            border: Border.all(color: Color(0xFF081c15), width: 2),
          ),
          height: MediaQuery.of(context).size.height * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: PageView.builder(
                controller: pc,
                itemCount: page.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://quran-images-api.herokuapp.com/show/page/${index + 1}',
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '- ${index + 1} -',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    ));
  }
}
