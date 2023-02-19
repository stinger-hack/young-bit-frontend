import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Color(0xff333333)
          )
      ),
      const SizedBox(width: 12),
      Container(
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
    ]
  );
}