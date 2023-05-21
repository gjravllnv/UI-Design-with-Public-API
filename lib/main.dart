import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csfe2_p5_api/json.dart';

import 'json1.dart';
import 'json2.dart';
import 'json3.dart';
import 'json4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(primarySwatch: Colors.orange),
            // darkTheme: ThemeData.dark(),
            // themeMode: currentMode,
            theme: ThemeData.dark(),
            home: DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: AppBar(
                  leading: Container(
                      child: Image.asset(
                    'assets/icon.png',
                    width: 20,
                  )),
                  // actions: [
                  //   IconButton(
                  //       icon: Icon(
                  //           TabBarDemo.themeNotifier.value == ThemeMode.light
                  //               ? Icons.dark_mode
                  //               : Icons.light_mode),
                  //       onPressed: () {
                  //         TabBarDemo.themeNotifier.value =
                  //             TabBarDemo.themeNotifier.value == ThemeMode.light
                  //                 ? ThemeMode.dark
                  //                 : ThemeMode.light;
                  //       })
                  // ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(CupertinoIcons.photo)),
                      Tab(icon: Icon(CupertinoIcons.photo_fill_on_rectangle_fill)),
                      Tab(icon: Icon(Icons.photo_filter_sharp)),
                      Tab(icon: Icon(Icons.menu))
                    ],
                  ),
                  title: const Text(
                    'Flutter API',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Album(),
                    Albumx(),
                    Albumxx(),
                    Albumxxx(),
                    Albumxxxx(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}