import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/fontstyles.dart';

Widget dateWidget(String date) {
  return Expanded(
    child: Align(
      alignment: FractionalOffset.bottomLeft,
      child: Text(
        calculateDateDifference(DateTime.now(), dateTimeFromString(date)),
        style: greyDateTextStyle,
      ),
    ),
  );
}

String calculateDateDifference(DateTime startDate, DateTime endDate) {
  Duration difference = startDate.difference(endDate);

  int days = difference.inDays;
  int hours = difference.inHours.remainder(24);
  int minutes = difference.inMinutes.remainder(60);

  String result = '';
  if (days > 0) {
    return dateTimeString(endDate);
  }
  if (hours > 0) {
    result += '$hours hour${hours > 1 ? 's' : ''} ';
  }
  if (minutes > 0 || (days == 0 && hours == 0)) {
    result += '$minutes minute${minutes > 1 ? 's' : ''}';
  }

  return '${result.trim()} ago';
}

DateTime dateTimeFromString(String date) {
  var dateTimeList = date.split('T');
  var dateList = dateTimeList[0].split('-');
  var timeList = dateTimeList[1].split('Z')[0].split(':');

  var date1 = DateTime(
    int.parse(dateList[0]),
    int.parse(dateList[1]),
    int.parse(dateList[2]),
    int.parse(timeList[0]),
    int.parse(timeList[1]),
    int.parse(timeList[2]),
  );

  return date1;
}

String dateTimeString(DateTime date1) {
  var day = getDayOfWeek(date1);
  var month = getMonthName(date1);
  return '$day,${date1.day} $month ${date1.year}, ${date1.hour}:${date1.minute} GMT';
}

String getDayOfWeek(DateTime date) {
  switch (date.weekday) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return 'Unknown';
  }
}

String getMonthName(DateTime date) {
  switch (date.month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'Aug';
    case 9:
      return 'Sept';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return 'Unknown';
  }
}
