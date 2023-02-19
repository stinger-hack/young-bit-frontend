import 'dart:convert';

import 'package:admin/ui/widgets/custom_app_bar.dart';
import 'package:admin/ui/widgets/custom_button.dart';
import 'package:admin/ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/shop_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<ShopModel> products = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() => isLoading = true);
    var response = await http.get(Uri.parse("http://stingerhack.space:8000/api/shop"));
    if (response.statusCode == 200) {
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      List body = jsonDecode(utf8.decode(response.bodyBytes))["body"];
      for (var product in body) {
           products.add(ShopModel.fromJson(product));
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
                    title: "МАГАЗИН",
                    isSearch: true
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 52,
                    right: 42,
                    bottom: 16
                  ),
                  child: Row(
                    children: const [
                      CustomTitle(text: "КАТАЛОГ"),
                      Spacer(),
                      Icon(
                          Icons.more_vert,
                          color: Color(0xff9462E0)
                      )
                    ]
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32
                  ),
                  child: Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      children: [
                        for (ShopModel product in products)
                        Column(
                            children: [
                              Container(
                                  height: 190,
                                  width: (MediaQuery.of(context).size.width - 240) / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(product.image),
                                        fit: BoxFit.cover
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(4, 4),
                                            blurRadius: 24,
                                            color: const Color(0xff000000).withOpacity(0.08)
                                        )
                                      ]
                                  )
                              ),
                              Container(
                                  height: 178,
                                  width: (MediaQuery.of(context).size.width - 240) / 4,
                                  padding: const EdgeInsets.all(10),
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            product.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18,
                                                color: Color(0xff9462E0)
                                            )
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                            product.description,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                color: Color(0xff333333)
                                            )
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                            children: [
                                              Text(
                                                  product.cost.toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 20,
                                                      color: Color(0xff333333)
                                                  )
                                              ),
                                              const SizedBox(width: 6),
                                              Image.asset("assets/images/medal.png"),
                                              const Spacer(),
                                              const CustomButton(text: "купить")
                                            ]
                                        )
                                      ]
                                  )
                              )
                            ]
                        )
                      ]
                  )
                )
              ]
          )
      )
  );
}