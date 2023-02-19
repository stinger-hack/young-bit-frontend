import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateInitiative extends StatefulWidget {
  const CreateInitiative({super.key});

  @override
  State<CreateInitiative> createState() => _CreateInitiativeState();
}

class _CreateInitiativeState extends State<CreateInitiative> {
  final TextEditingController _anonymusController = TextEditingController();

  final TextEditingController _publicationController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _tagController = TextEditingController();

  bool isAnonymus = false;

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
                    Row(
                        children: [
                          PopupMenuButton(
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
                                    controller: _anonymusController,
                                    enabled: false,
                                    onChanged: (value) => setState(() {}),
                                    decoration: InputDecoration(
                                        hintText: "Анонимность",
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
                            onSelected: (value) => setState(() => _anonymusController.text = value
                                ? "Да"
                                : "Нет"
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: false,
                                child: Text('Нет'),
                              ),
                              const PopupMenuItem(
                                value: true,
                                child: Text('Да'),
                              )
                            ]
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
                              padding: const EdgeInsets.only(
                                  top: 4,
                                  left: 12,
                                  right: 12,
                                  bottom: 8
                              ),
                              child: TextField(
                                controller: _publicationController,
                                  onChanged: (value) => setState(() {}),
                                  decoration: InputDecoration(
                                      hintText: "Публикация",
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
                            onChanged: (value) => setState(() {}),
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Выберите описание инициативы",
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
                    Container(
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
                            controller: _tagController,
                            onChanged: (value) => setState(() {}),
                            decoration: InputDecoration(
                                hintText: "Введите тег",
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
                                    Uri.parse("http://stingerhack.space:8000/api/initiative"),
                                    headers: {"Content-Type": "application/json"},
                                    body: jsonEncode({
                                      "title": _descriptionController.text,
                                      "main_text": _descriptionController.text,
                                      "imgage_url": "string",
                                      "tags": _tagController.text,
                                      "is_anonymous": _anonymusController.text == "Да" ? true : false
                                    })
                                );
                                print(response.statusCode);
                                print(response.body);
                                Navigator.of(context).pop();
                              },
                              child: _publicationController.text.isNotEmpty
                                  && _descriptionController.text.isNotEmpty
                                  && _tagController.text.isNotEmpty
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