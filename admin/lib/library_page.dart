import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'custom_button.dart';
import 'library_model.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _controller = TextEditingController();

  List<LibraryModel> software = [];
  List<LibraryModel> legislation = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
getData();
  }

  void getData() async {
    setState(() => isLoading = true);
    var response = await http.get(Uri.parse("http://stingerhack.space:8000/api/library"));
    if (response.statusCode == 200) {
      software = [];
      legislation = [];
      List softwareList = jsonDecode(utf8.decode(response.bodyBytes))["body"]["СОФТ"];
      print(softwareList);
      List legislationList = jsonDecode(utf8.decode(response.bodyBytes))["body"]["ЗАКОНОДАТЕЛЬСТВО"];
      for (var soft in softwareList) {
        software.add(LibraryModel.fromJson(soft));
      }
      for (var leg in legislationList) {
        legislation.add(LibraryModel.fromJson(leg));
      }
    }
    setState(() => isLoading = false);
  }

  void sort(String value) {

  }

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
        color: const Color(0xffFFFFFF),
        child: isLoading
            ? const Center(
            child: CircularProgressIndicator()
        )
            : ListView(
            children: [
              Container(
                height: 72,
                padding: const EdgeInsets.only(
                    left: 52,
                    right: 15
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 6,
                          color: const Color(0xff000000).withOpacity(0.08)
                      )
                    ]
                ),
                child: Row(
                    children: [
                      const Text(
                          "БИБЛИОТЕКА",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Color(0xff333333)
                          )
                      ),
                      const Spacer(),
                      Container(
                          height: 42,
                          width: 365,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 14
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                  color: const Color(0xffEDE6F8)
                              )
                          ),
                          child: TextField(
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(bottom: 20),
                                  hintText: "Найти...",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Color(0xffCCCCCC)
                                  ),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() => _controller.text = "");
                                      },
                                      child: const Icon(
                                          Icons.search,
                                          color: Color(0xff9462E0)
                                      )
                                  )
                              )
                          )
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                          height: 42,
                          width: 49,
                          child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset("images/notification.png")
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        height: 22,
                                        width: 22,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff9462E0)
                                        ),
                                        child: const Text(
                                            "4",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color(0xffFFFFFF)
                                            )
                                        )
                                    )
                                )
                              ]
                          )
                      ),
                      const SizedBox(width: 23),
                      SizedBox(
                        height: 42,
                        width: 42,
                        child: Stack(
                            children: [
                              Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage("images/avatar.png")
                                      )
                                  )
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffDAEF14)
                                      )
                                  )
                              )
                            ]
                        )
                      )
                    ]
                ),
              ),
        Padding(
            padding: const EdgeInsets.only(
                top: 32,
                left: 52,
                right: 32,
                bottom: 20
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                      "ЗАКОНОДАТЕЛЬСТВО",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Color(0xff333333)
                      )
                  ),
                  Text(
                      "ЕЩЁ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Color(0xff9462E0)
                      )
                  )
                ]
            )
        ),
        SizedBox(
          height: 422,
          child: ListView.builder(
              itemCount: software.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 32),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                      children: [
                        Container(
                            height: 190,
                            width: 344,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(software[index].image)
                                )
                            )
                        ),
                        Container(
                            height: 232,
                            width: 344,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(4, 4),
                                      blurRadius: 24,
                                      color: const Color(0xff000000).withOpacity(0.08)
                                  )
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      software[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          color: Color(0xff9462E0)
                                      )
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                      "Как пользоваться Zoom? Легко! Эта инструкция научит вас всему, что нужно знать, для комфортного общения с клиентами.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          color: Color(0xff333333)
                                      )
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                      children: [
                                        Text(
                                            "${software[index].progress}%",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                color: Color(0xff333333)
                                            )
                                        ),
                                        const SizedBox(width: 11),
                                        Container(
                                          height: 10,
                                            width: 102,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: LinearProgressIndicator(
                                                backgroundColor: const Color(0xffFFFFFF),
                                                color: const Color(0xffC8AEEF),
                                                value: software[index].progress / 100
                                            )
                                        ),
                                        const Spacer(),
                                        const CustomButton(text: "продолжить")
                                      ]
                                  )
                                ]
                            )
                        ),

                      ]
                  )
              )
          )
        ),
              const SizedBox(height: 22),
              Container(
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: const Color(0xffEDE6F8),
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 32,
                      left: 52,
                      right: 32,
                      bottom: 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                          "ЗАКОНОДАТЕЛЬСТВО",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xff333333)
                          )
                      ),
                      Text(
                        "ЕЩЁ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xff9462E0)
                          )
                      )
                    ]
                  )
              ),
              SizedBox(
                  height: 422,
                  child: ListView.builder(
                      itemCount: legislation.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 32),
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                              children: [
                                Container(
                                    height: 190,
                                    width: 344,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20)
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(legislation[index].image)
                                        )
                                    )
                                ),
                                Container(
                                    height: 232,
                                    width: 344,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFFFFFF),
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(4, 4),
                                              blurRadius: 24,
                                              color: const Color(0xff000000).withOpacity(0.08)
                                          )
                                        ]
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              legislation[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 20,
                                                  color: Color(0xff9462E0)
                                              )
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                              "Как пользоваться Zoom? Легко! Эта инструкция научит вас всему, что нужно знать, для комфортного общения с клиентами.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  color: Color(0xff333333)
                                              )
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                              children: [
                                                Text(
                                                    "${legislation[index].progress}%",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 16,
                                                        color: Color(0xff333333)
                                                    )
                                                ),
                                                const SizedBox(width: 11),
                                                Container(
                                                    height: 10,
                                                    width: 102,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: LinearProgressIndicator(
                                                        backgroundColor: const Color(0xffFFFFFF),
                                                        color: const Color(0xffC8AEEF),
                                                        value: legislation[index].progress / 100
                                                    )
                                                ),
                                                const Spacer(),
                                                const CustomButton(text: "продолжить")
                                              ]
                                          )
                                        ]
                                    )
                                ),

                              ]
                          )
                      )
                  )
              )
            ]
        )
    )
  );
}