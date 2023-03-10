import 'dart:convert';
import 'dart:html';

import 'package:admin/ui/widgets/custom_app_bar.dart';
import 'package:admin/ui/widgets/dialogs/create_initiative.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_button.dart';
import '../../models/event_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();

  List<EventModel> events = [];
  List<EventModel> initiatives = [];

  bool isLoading = true;

  String error = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() => isLoading = true);
    var response = await http.get(Uri.parse("http://stingerhack.space:8000/api/news?news_type=INITIATIVE"));
    if (response.statusCode == 200) {
      events = [];
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"];
      for (var event in body) {
        events.add(EventModel.fromJson(event));
      }
    }
    response = await http.get(Uri.parse("http://stingerhack.space:8000/api/admin/news?news_type=INITIATIVE"));
    if (response.statusCode == 200) {
      initiatives = [];
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"];
      for (var event in body) {
        initiatives.add(EventModel.fromJson(event));
      }
    }
    // response = await http.post(
    //     Uri.parse("http://stingerhack.space:8000/api/admin/news"),
    //     headers: {"Content-Type": "application/json"},
    //   body: jsonEncode({
    //     "title": "Изучение процессов работы компании. Задание: ознакомиться с процессом подачи заявок на гранты и условиями акселерационных программ. Вся информация есть в Ководстве.",
    //     "main_text": "string",
    //     "image_url": "https://storage.yandexcloud.net/onboarding/a611efc7a2f44c9cb8243b30a37b56ad.png",
    //     "user_id": 0,
    //     "news_type": "INITIATIVE"
    //   })
    // );
    // print(response.statusCode);
    // print(response.body);
    setState(() => isLoading = false);
  }

  String getDate(String value) {
    String date = "";
    DateTime dateTime = DateTime.parse(value);
    DateTime dateTimeNow = DateTime.now();
    DateTime dateTimePrevious = DateTime.now().subtract(const Duration(days: 1));
    if (dateTime.year == dateTimeNow.year
        && dateTime.month == dateTimeNow.month
        && dateTime.day == dateTimeNow.day) {
      date = "сегодня в ";
    }
    else if (dateTime.year == dateTimePrevious.year
        && dateTime.month == dateTimePrevious.month
        && dateTime.day == dateTimePrevious.day) {
      date = "вчера в ";
    }
    else {
      date = "${dateTime.day}.${dateTime.month}.${dateTime.year} в ";
    }
    List<String> dayTime = value.split("T")[1].split(":");
    date += "${dayTime[0]}:${dayTime[1]}";
    return date;
  }

  void sort(String value) {
    List<EventModel> newEvents = [];
    for (var event in events) {
      if (event.title.contains(value)) {
        newEvents.add(event);
      }
    }
    setState(() => events = newEvents);
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
                const CustomAppBar(
                    title: "ГЛАВНАЯ",
                    isSearch: false
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                left: 20,
                                                right: 12,
                                                bottom: 20
                                            ),
                                            child: Text(
                                                "СОБЫТИЯ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20,
                                                    color: Color(0xff333333)
                                                )
                                            )
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) => const CreateInitiative()
                                            ).then((value) => getData());
                                          },
                                          child: Container(
                                              height: 32,
                                              width: 32,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(0xffEDE6F8)
                                                  )
                                              ),
                                              child: const Icon(
                                                  Icons.add,
                                                  color: Color(0xff9462E0),
                                                  size: 24
                                              )
                                          )
                                        ),
                                        const Spacer(),
                                        Container(
                                            height: 32,
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
                                                  contentPadding: const EdgeInsets.only(bottom: 20),
                                                    border: InputBorder.none,
                                                    hintText: "Найти...",
                                                    hintStyle: const TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 14,
                                                        color: Color(0xffCCCCCC)
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                        onTap: () {
                                                          if (_controller.text == "") {
                                                            getData();
                                                          }
                                                          else {
                                                            sort(_controller.text);
                                                          }
                                                        },
                                                        child: const Icon(
                                                            Icons.search,
                                                            color: Color(0xff9462E0)
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                  Wrap(
                                      spacing: 21,
                                      runSpacing: 20,
                                      children: [
                                        for (EventModel event in events)
                                          Column(
                                              children: [
                                                Container(
                                                    height: 170,
                                                    width: (MediaQuery.of(context).size.width - 710) / 2,
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.only(
                                                            topLeft: Radius.circular(20),
                                                            topRight: Radius.circular(20)
                                                        ),
                                                        image: DecorationImage(
                                                            image: NetworkImage(event.image),
                                                          fit: BoxFit.cover
                                                        )
                                                    )
                                                ),
                                                Container(
                                                    height: 120,
                                                    width: (MediaQuery.of(context).size.width - 710) / 2,
                                                    padding: const EdgeInsets.all(20),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xffFFFFFF),
                                                        borderRadius: const BorderRadius.only(
                                                            bottomLeft: Radius.circular(20),
                                                            bottomRight: Radius.circular(20)
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset: const Offset(4, 4),
                                                              blurRadius: 24,
                                                              color: const Color(0xff000000).withOpacity(0.08)
                                                          )
                                                        ]
                                                    ),
                                                    child: Text(
                                                        event.title,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 16,
                                                            color: Color(0xff333333)
                                                        )
                                                    )
                                                )
                                              ]
                                          )
                                      ]
                                  )
                                ]
                            )
                          )
                      ),
                      Container(
                        width: 529,
                        padding: const EdgeInsets.only(
                          top: 37,
                          right: 32,
                          bottom: 37
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 22,
                                bottom: 10
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "ИНИЦИАТИВЫ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Color(0xff333333)
                                    )
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                      initiatives.length.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          color: Color(0xff9462E0)
                                      )
                                  )
                                ]
                              )
                            ),
                            for (EventModel initiative in initiatives)
                              Container(
                                width: 497,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10
                                ),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xffEDE6F8),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (initiative.user != null)
                                    Row(
                                      children: [
                                        Container(
                                            height: 42,
                                            width: 42,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(initiative.user!.image)
                                                )
                                            )
                                        ),
                                        const SizedBox(width: 12),
                                        RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18,
                                                color: Color(0xff333333)
                                              ),
                                              children: [
                                                TextSpan(text: initiative.user!.firstName),
                                                TextSpan(text: " ${initiative.user!.lastName}"),
                                              ]
                                            )
                                        ),
                                        const Spacer(),
                                        const Icon(
                                            Icons.more_vert,
                                          color: Color(0xff9462E0),
                                        )
                                      ]
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      initiative.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        color: Color(0xff333333)
                                      )
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          getDate(initiative.createdAt),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: Color(0xff999999)
                                          )
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () async {
                                            final response = await http.post(
                                                Uri.parse("http://stingerhack.space:8000/api/admin/news/approve_news"),
                                                headers: {"Content-Type": "application/json"},
                                                body: jsonEncode({
                                                  "news_id": initiative.id,
                                                  "is_approved": false
                                                })
                                            );
                                            print(response.statusCode);
                                            print(response.body);
                                            if (response.statusCode == 200) {
                                              getData();
                                            }
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 14
                                              ),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffFFFFFF),
                                                  borderRadius: BorderRadius.circular(22)
                                              ),
                                              child: const Text(
                                                  "удалить",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Color(0xff9462E0)
                                                  )
                                              )
                                          )
                                        ),
                                        const SizedBox(width: 20),
                                        GestureDetector(
                                            onTap: () async {
                                              final response = await http.post(
                                                        Uri.parse("http://stingerhack.space:8000/api/admin/news/approve_news"),
                                                  headers: {"Content-Type": "application/json"},
                                                      body: jsonEncode({
                                                        "news_id": initiative.id,
                                                        "is_approved": true
                                                      })
                                                    );
                                              print(response.statusCode);
                                              print(response.body);
                                              if (response.statusCode == 200) {
                                                getData();
                                              }
                                            },
                                            child: const CustomButton(text: "опубликовать")
                                        )
                                      ]
                                    )
                                  ]
                                )
                              )
                          ]
                        )
                      )
                    ]
                )
              ]
          )
      )
  );
}