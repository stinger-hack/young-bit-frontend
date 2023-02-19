import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.isSearch
  });

  final String title;
  final bool isSearch;

  @override
  Widget build(BuildContext context) => Container(
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
          Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xff333333)
              )
          ),
          const Spacer(),
          if (isSearch)
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
                        child: Image.asset("assets/images/notification.png")
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
                                image: AssetImage("assets/images/avatar.png")
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
  );
}