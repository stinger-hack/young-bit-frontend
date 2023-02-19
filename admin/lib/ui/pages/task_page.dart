import 'dart:convert';

import 'package:admin/models/important_model.dart';
import 'package:admin/ui/widgets/dialogs/create_task.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/task_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_title.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskModel> tasks = [];
  List<ImportantModel> importants = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() => isLoading = true);
    var response = await http.get(Uri.parse("http://stingerhack.space:8000/api/tasks?task_type=INDIVIDUAL"));
    if (response.statusCode == 200) {
      tasks = [];
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"]["tasks"];
      for (var task in body) {
        tasks.add(TaskModel.fromJson(task));
      }
    }
    response = await http.get(Uri.parse("http://stingerhack.space:8000/api/important"));
    if (response.statusCode == 200) {
     importants = [];
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"];
      for (var important in body) {
        importants.add(ImportantModel.fromJson(important));
      }
    }
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
                    title: "ЗАДАНИЯ",
                    isSearch: true
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 28,
                                left: 52,
                                bottom: 5
                              ),
                              child: GestureDetector(
  onTap: () => showDialog(
  context: context,
  builder: (context) => const CreateTask()
  ).then((value) => getData()),
  child: const CustomTitle(text: "ЗАДАНИЯ")
  )
                            ),
                            Column(
                                children: [
                                  for (TaskModel task in tasks)
                                    Container(
                                        height: 213,
                                        padding: const EdgeInsets.only(
                                            top: 35,
                                            left: 20,
                                            right: 20,
                                            bottom: 20
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 32
                                        ),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffFFFFFF),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(4, 4),
                                                  blurRadius: 24,
                                                  color: const Color(0xff000000).withOpacity(0.08)
                                              )
                                            ]
                                        ),
                                        child: Column(
                                            children: [
                                              Row(
                                                  children: [
                                                    Image.network(
                                                        task.image,
                                                      height: 116,
                                                      width: 167,
                                                      fit: BoxFit.cover
                                                    ),
                                                    const SizedBox(width: 32),
                                                    Expanded(
                                                        child: Text(
                                                            task.description,
                                                            style: const TextStyle(
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 16,
                                                                color: Color(0xff333333)
                                                            )
                                                        )
                                                    )
                                                  ]
                                              ),
                                              const SizedBox(height: 19),
                                              Row(
                                                  children: [
                                                    Text(
                                                        "${task.progress}%",
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 20,
                                                            color: Color(0xff333333)
                                                        )
                                                    ),
                                                    const SizedBox(width: 24),
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(9),
                                                        child: Container(
                                                            height: 10,
                                                            width: 153,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(
                                                                    color: const Color(0xffC8AEEF)
                                                                )
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(9),
                                                                child: LinearProgressIndicator(
                                                                    backgroundColor: const Color(0xffFFFFFF),
                                                                    color: const Color(0xffC8AEEF),
                                                                    value: task.progress / 100
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    const Spacer(),
                                                    const Text(
                                                        "На выполнении",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 16,
                                                            color: Color(0xff9462E0)
                                                        )
                                                    )
                                                  ]
                                              )
                                            ]
                                        )
                                    )
                                ]
                            )
                          ]
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 28,
                                left: 22,
                                bottom: 5
                            ),
                            child: CustomTitle(text: "Важное")
                        ),
                        for (var important in importants)
                          Container(
                            width: 497,
                            margin: const EdgeInsets.only(
                                top: 10,
                              bottom: 10,
                              right: 32
                            ),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xffEDE6F8),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                Text(
                                  important.text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xff333333)
                                  )
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        getDate(important.createdAt),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: Color(0xff999999)
                                        )
                                    ),
                                    const Text(
                                      "Подтвердило 12/16",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Color(0xff9462E0)
                                      )
                                    )
                                  ]
                                )
                              ]
                            )
                          )
                      ]
                    )
                  ]
                )
              ]
          )
      )
  );
}