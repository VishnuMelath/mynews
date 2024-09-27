import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';

Widget customTextField(
    {required String label,
    void Function()? onTap,
    required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
    child: Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
          color: white, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        style: const TextStyle(fontSize: 12),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label cannot be empty';
          }
          return null;
        },
        cursorHeight: 12,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            isDense: true,
            hintStyle: const TextStyle(fontSize: 12)),
      ),
    ),
  );
}
