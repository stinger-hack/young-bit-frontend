import 'package:admin/ui/pages/shop_page.dart';
import 'package:admin/ui/pages/statistic_page.dart';
import 'package:admin/ui/pages/task_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'ui/pages/library_page.dart';
import 'ui/pages/main_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'GT Eesti'),
        localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ru', 'RU'),
          ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  Widget mainBody() {
    switch (index) {
      case 0:
        return const MainPage();
      case 1:
        return const TaskPage();
      case 2:
        return const StatisticPage();
      case 3:
        return const LibraryPage();
      case 4:
        return const ShopPage();
      default:
        return const MainPage();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: 80,
          color: const Color(0xffC8AEEF),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 50 + index * 95,
                right: 0,
                child: Image.asset("assets/images/current_index.png")
              ),
              Column(
                  children: [
                    const SizedBox(height: 22),
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(height: 23),
                    GestureDetector(
                      onTap: () => setState(() => index = 0),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.transparent,
                        child: Image.asset(
                            "assets/images/main.png",
                            color: index == 0
                                ? const Color(0xffC8AEEF)
                                : Colors.white
                        )
                      )
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                        onTap: () => setState(() => index = 1),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "assets/images/sber.png",
                                color: index == 1
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                        onTap: () => setState(() => index = 2),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "assets/images/graph.png",
                                color: index == 2
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                        onTap: () => setState(() => index = 3),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "assets/images/books.png",
                                color: index == 3
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                        onTap: () => setState(() => index = 4),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "assets/images/bag.png",
                                color: index == 4
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    // GestureDetector(
                    //     onTap: () => setState(() => index = 0),
                    //     child: Container(
                    //         height: 126,
                    //         width: 108,
                    //         color: Colors.transparent,
                    //         child: Stack(
                    //             children: [
                    //               if (index == 0)
                    //                 Align(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Image.asset("images/current_index.png")
                    //                 ),
                    //               Center(
                    //                   child: Image.asset(
                    //                       "images/main.png",
                    //                       color: index == 0
                    //                           ? const Color(0xffC8AEEF)
                    //                           : Colors.white
                    //                   )
                    //               )
                    //             ]
                    //         )
                    //     )
                    // ),
                    // GestureDetector(
                    //     onTap: () => setState(() => index = 1),
                    //     child: Container(
                    //         height: 126,
                    //         width: 108,
                    //         color: Colors.transparent,
                    //         child: Stack(
                    //             children: [
                    //               if (index == 1)
                    //                 Align(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Image.asset("images/current_index.png")
                    //                 ),
                    //               Center(
                    //                   child: Image.asset(
                    //                       "images/sber.png",
                    //                       color: index == 1
                    //                           ? const Color(0xffC8AEEF)
                    //                           : Colors.white
                    //                   )
                    //               )
                    //             ]
                    //         )
                    //     )
                    // ),
                    // GestureDetector(
                    //     onTap: () => setState(() => index = 2),
                    //     child: Container(
                    //         height: 126,
                    //         width: 108,
                    //         color: Colors.transparent,
                    //         child: Stack(
                    //             children: [
                    //               if (index == 2)
                    //                 Align(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Image.asset("images/current_index.png")
                    //                 ),
                    //               Center(
                    //                   child: Image.asset(
                    //                       "images/graph.png",
                    //                       color: index == 2
                    //                           ? const Color(0xffC8AEEF)
                    //                           : Colors.white
                    //                   )
                    //               )
                    //             ]
                    //         )
                    //     )
                    // ),
                    // GestureDetector(
                    //     onTap: () => setState(() => index = 3),
                    //     child: Container(
                    //         height: 126,
                    //         width: 108,
                    //         color: Colors.transparent,
                    //         child: Stack(
                    //             children: [
                    //               if (index == 3)
                    //                 Align(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Image.asset("images/current_index.png")
                    //                 ),
                    //               Center(
                    //                   child: Image.asset(
                    //                       "images/books.png",
                    //                       color: index == 3
                    //                           ? const Color(0xffC8AEEF)
                    //                           : Colors.white
                    //                   )
                    //               )
                    //             ]
                    //         )
                    //     )
                    // ),
                    // GestureDetector(
                    //     onTap: () => setState(() => index = 3),
                    //     child: Container(
                    //         height: 126,
                    //         width: 108,
                    //         color: Colors.transparent,
                    //         child: Stack(
                    //             children: [
                    //               if (index == 3)
                    //                 Align(
                    //                     alignment: Alignment.centerRight,
                    //                     child: Image.asset("images/current_index.png")
                    //                 ),
                    //               Center(
                    //                   child: Image.asset(
                    //                       "images/bag.png",
                    //                       color: index == 3
                    //                           ? const Color(0xffC8AEEF)
                    //                           : Colors.white
                    //                   )
                    //               )
                    //             ]
                    //         )
                    //     )
                    // ),
                    const Spacer(),
                    Image.asset("assets/images/question.png"),
                    const SizedBox(height: 32)
                  ]
              )
            ]
          )
        ),
        mainBody()
      ]
    )
  );
}
