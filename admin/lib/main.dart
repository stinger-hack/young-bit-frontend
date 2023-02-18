import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';
import 'library_page.dart';
import 'main_page.dart';

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
      case 3:
        return const LibraryPage();
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
          width: 108,
          color: const Color(0xffC8AEEF),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 40 + index * 100,
                right: 0,
                child: Image.asset("images/current_index.png")
              ),
              Column(
                  children: [
                    const SizedBox(height: 22),
                    Image.asset("images/logo.png"),
                    const SizedBox(height: 23),
                    GestureDetector(
                      onTap: () => setState(() => index = 0),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.transparent,
                        child: Image.asset(
                            "images/main.png",
                            color: index == 0
                                ? const Color(0xffC8AEEF)
                                : Colors.white
                        )
                      )
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                        onTap: () => setState(() => index = 1),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "images/sber.png",
                                color: index == 1
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                        onTap: () => setState(() => index = 2),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "images/graph.png",
                                color: index == 2
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                        onTap: () => setState(() => index = 3),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "images/books.png",
                                color: index == 3
                                    ? const Color(0xffC8AEEF)
                                    : Colors.white
                            )
                        )
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                        onTap: () => setState(() => index = 4),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Image.asset(
                                "images/bag.png",
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
                    Image.asset("images/question.png"),
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
