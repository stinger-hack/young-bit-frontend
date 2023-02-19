import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14
      ),
      decoration: BoxDecoration(
          color: const Color(0xff9462E0),
          borderRadius: BorderRadius.circular(22)
      ),
      child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xffFFFFFF)
          )
      )
  );
}