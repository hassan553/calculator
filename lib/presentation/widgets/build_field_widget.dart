import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const FieldWidget({super.key, required this.title,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
