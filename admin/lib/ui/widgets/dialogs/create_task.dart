import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _departmentController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _kpiController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) => Center(
    child: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 319,
          width: 762,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          "СОЗДАНИЕ ЗАДАНИЯ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Color(0xff333333)
                          )
                      ),
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                              Icons.close,
                              color: Color(0xff333333)
                          )
                      )
                    ]
                ),
                const SizedBox(height: 28),
                PopupMenuButton(
                    child: Container(
                        height: 32,
                        width: 722,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color(0xffEDE6F8)
                            )
                        ),
                        padding: const EdgeInsets.only(
                            top: 4,
                            left: 12,
                            right: 12,
                            bottom: 8
                        ),
                        child: TextField(
                            controller: _departmentController,
                            enabled: false,
                            onChanged: (value) => setState(() {}),
                            decoration: InputDecoration(
                                hintText: "Выберите отдел или сотрудника",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: const Color(0xff999999).withOpacity(0.6)
                                ),
                                border: InputBorder.none,
                                suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff9462E0)
                                )
                            )
                        )
                    ),
                    onSelected: (value) => setState(() => _departmentController.text = value
                        ? "Сотрудник"
                        : "Отдел"
                    ),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        value: false,
                        child: Text('Отдел'),
                      ),
                      const PopupMenuItem(
                        value: true,
                        child: Text('Сотрудник'),
                      )
                    ]
                ),
                const SizedBox(height: 12),
                Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? value = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1930),
                              lastDate: DateTime.now(),
                              locale: const Locale('ru', 'RU'),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xffC8AEEF),
                                    onPrimary: Color(0xffffffff),
                                    onSurface: Color(0xff333333)
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xff9462E0)
                                    )
                                  )
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (value != null) {
                            setState(() => _dateController.text = "${value.day}.${value.month}.${value.year}");
                          }
                        },
                        child: Container(
                            height: 32,
                            width: 355,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xffEDE6F8)
                                )
                            ),
                            padding: const EdgeInsets.only(
                                top: 4,
                                left: 12,
                                right: 12,
                                bottom: 8
                            ),
                            child: TextField(
                                controller: _dateController,
                                enabled: false,
                                onChanged: (value) => setState(() {}),
                                decoration: InputDecoration(
                                    hintText: "Выберите дату выполнения",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: const Color(0xff999999).withOpacity(0.6)
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xff9462E0)
                                    )
                                )
                            )
                        )
                      ),
                      const SizedBox(width: 12),
                      Container(
                          height: 32,
                          width: 355,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: const Color(0xffEDE6F8)
                              )
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12
                          ),
                          child: TextField(
                              controller: _kpiController,
                              onChanged: (value) => setState(() {}),
                              decoration: InputDecoration(
                                  hintText: "Задайте KPI",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: const Color(0xff999999).withOpacity(0.6)
                                  ),
                                  border: InputBorder.none
                              )
                          )
                      ),
                    ]
                ),
                const SizedBox(height: 12),
                Container(
                    height: 84,
                    width: 722,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xffEDE6F8)
                        )
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12
                    ),
                    child: TextField(
                        controller: _descriptionController,
                        maxLines: null,
                        onChanged: (value) => setState(() {}),
                        decoration: InputDecoration(
                            hintText: "Выберите описание задания",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: const Color(0xff999999).withOpacity(0.6)
                            ),
                            border: InputBorder.none
                        )
                    )
                ),
                const SizedBox(height: 12),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                              height: 24,
                              width: 150,
                              color: Colors.transparent,
                              child: Row(
                                  children: [
                                    Image.asset("assets/images/file.png"),
                                    const SizedBox(width: 4),
                                    const Text(
                                        "Прикрепить файл",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: Color(0xffA175E3)
                                        )
                                    )
                                  ]
                              )
                          )
                      ),
                      GestureDetector(
                        onTap: () async {
                          final response = await http.post(
                              Uri.parse("http://stingerhack.space:8000/api/tasks/${_departmentController.text == "Сотрудник"
                                  ? "individual"
                                  : "department"}"),
                              headers: {"Content-Type": "application/json"},
                              body: jsonEncode({
                                "title": _departmentController.text,
                                "description": _descriptionController.text,
                                "img_link": "string",
                                "cost": int.parse(_kpiController.text),
                                "department_id": 1
                              })
                          );
                          print(response.statusCode);
                          print(response.body);
                          Navigator.of(context).pop();
                        },
                          child: _departmentController.text.isNotEmpty
                              && _dateController.text.isNotEmpty
                              && _descriptionController.text.isNotEmpty
                              && _kpiController.text.isNotEmpty
                              ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 14
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: const Color(0xff9462E0)
                              ),
                              child: const Text(
                                  "СОЗДАТЬ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xffFFFFFF)
                                  )
                              )
                          ) : Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 14
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: const Color(0xffEDE6F8)
                                  )
                              ),
                              child: const Text(
                                  "СОЗДАТЬ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xffC8AEEF)
                                  )
                              )
                          )
                      )
                    ]
                )
              ]
          )
      )
    )
  );
}