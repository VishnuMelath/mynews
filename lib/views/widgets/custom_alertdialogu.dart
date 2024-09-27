import 'package:flutter/material.dart';
import 'package:mynews/views/widgets/custom_button.dart';

void customAlertDialog(
    String message, BuildContext context, void Function() onTap) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [customButton(context, label: 'retry', onTap: onTap)],
      content: Text(message),
    ),
  );
}
