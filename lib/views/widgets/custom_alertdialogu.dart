import 'package:flutter/material.dart';
import 'package:mynews/utils/fontstyles.dart';
import 'package:mynews/views/widgets/custom_button.dart';

void customAlertDialog(
    String message, BuildContext context, void Function() onTap) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        Center(child: customButton(context, label: 'retry', onTap: onTap))
      ],
      title: Text(
        message,
        style: blackBoldTextStyle,
      ),
    ),
  );
}
