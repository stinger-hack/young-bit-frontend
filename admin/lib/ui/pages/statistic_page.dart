import 'dart:convert';
import 'dart:math';

import 'package:admin/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/employee_model.dart';
import '../../models/event_model.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<EmployeeModel> employees = [];

  List<int> colors = [
    0xffF0F1FE,
    0xffF9FCD7,
    0xffFFEAFC,
    0xffFFEAFC
  ];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() => isLoading = true);
    var response = await http.get(Uri.parse("http://stingerhack.space:8000/api/employees"));
    if (response.statusCode == 200) {
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"];
      for (var employee in body) {
        employees.add(EmployeeModel.fromJson(employee));
      }
    }
    setState(() => isLoading = false);
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
              title: "СТАТИСТИКА",
              isSearch: false
          ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 52,
                    right: 32,
                    bottom: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "ЗАДАНИЯ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Color(0xff333333)
                        )
                      ),
                      Text(
                          "Дополнительно",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xff9462E0)
                          )
                      )
                    ]
                  )
                ),
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width - 172,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 22
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
                  child: Image.asset("assets/images/statistic.png")
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 52,
                    right: 42,
                    bottom: 4
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "КОМАНДА",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Color(0xff333333)
                        )
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "47",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color(0xff333333)
                        )
                      ),
                      const SizedBox(width: 6),
                      Image.asset("assets/images/medal.png"),
                      const Spacer(),
                      const Icon(
                        Icons.more_vert,
                        color: Color(0xff9462E0)
                      )
                    ]
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    children: [
                      for (EmployeeModel employee in employees)
                      Container(
                        height: 365,
                        width: (MediaQuery.of(context).size.width - 236) / 3,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(20),
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
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(employee.image)
                                          )
                                      )
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18,
                                                    color: Color(0xff333333)
                                                ),
                                                children: [
                                                  TextSpan(text: employee.firstName),
                                                  TextSpan(text: " ${employee.lastName}"),
                                                ]
                                            )
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          employee.role,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: Color(0xff999999)
                                          )
                                        )
                                      ]
                                    ),
                                    const Spacer(),
                                    Text(
                                      employee.score.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: Color(0xff333333)
                                      )
                                    ),
                                    const SizedBox(width: 6),
                                    Image.asset("assets/images/medal.png")
                                  ]
                              ),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    children: [
                                      for (var card in employee.cards)
                                        Container(
                                            height: 72,
                                            width: 94.95,
                                            decoration: BoxDecoration(
                                                color: Color(colors[Random().nextInt(colors.length)]),
                                                borderRadius: BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    image: NetworkImage(card),
                                                    fit: BoxFit.cover
                                                )
                                            )
                                        )
                                    ]
                                )
                              )
                            ]
                        )
                      )
                    ]
                  )
                )
              ]
          )
      )
  );
}