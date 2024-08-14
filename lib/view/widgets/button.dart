import 'package:e_comm_project/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  const CustomButton({super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: onPressed,
               child: Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(buttonName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: white))
               )
             )
            ;
  }
}