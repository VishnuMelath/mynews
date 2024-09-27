import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';

showErrorSnackBar(BuildContext context, String message) {
  log('snakcbar');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message,style: const TextStyle(color: white),)));
}

showSuccessSnackBar(BuildContext context, String message) {
  log('snakcbar');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(message,style: const TextStyle(color: white),)));
}