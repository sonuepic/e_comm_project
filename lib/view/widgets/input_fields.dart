import 'package:e_comm_project/utils/colors.dart';
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const InputFields({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: black),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0)),
      ),
    );
  }
}
