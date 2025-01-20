



import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



/// Formats the date based on the provided type.
/// [type] 0: Current date, 1: Date range (last 30 days), 2: Current quarter.
String dateFormat({required int type}) {
  DateTime currentDate = DateTime.now();
  DateTime prevMonth = currentDate.subtract(const Duration(days: 30));

  if (type == 0) {
    String date = DateFormat('MMMM dd, yyyy').format(currentDate);
    return date;
  } else if (type == 1) {
    String current = DateFormat('MMM dd, yyyy').format(currentDate);
    String prev = DateFormat('MMM dd, yyyy').format(prevMonth);
    return '$prev - $current';
  } else {
    return getQuarterDateRange(currentDate);
  }
}

/// Returns the date range for the current quarter (Q1, Q2, etc.)
/// and the months of the quarter (e.g., 'Q1 January - March, 2025').
String getQuarterDateRange(DateTime date) {
  int month = date.month;
  String quarter = '';
  String startMonth = '';
  String endMonth = '';

  // Determine the quarter and the respective month names
  if (month >= 1 && month <= 3) {
    quarter = 'Q1';
    startMonth = 'January';
    endMonth = 'March';
  } else if (month >= 4 && month <= 6) {
    quarter = 'Q2';
    startMonth = 'April';
    endMonth = 'June';
  } else if (month >= 7 && month <= 9) {
    quarter = 'Q3';
    startMonth = 'July';
    endMonth = 'September';
  } else if (month >= 10 && month <= 12) {
    quarter = 'Q4';
    startMonth = 'October';
    endMonth = 'December';
  }

  // Return the formatted string with the quarter and the months
  return '$quarter $startMonth - $endMonth, ${date.year}';
}


Image logo(){
  return Image.asset('assets/images/sample.png');
}

Widget cover(){
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/cover.jpg'),fit: BoxFit.cover)
    ),
  );
}

/// Returns a profile card with a circular avatar.
/// [radius] controls the size of the avatar, allowing for responsiveness across platforms.
Widget profileCard({double? radius}){
  return Card(
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: const CircleBorder(
        side: BorderSide(
            color: MyColors.black
        )
    ),
    child: CircleAvatar(
      radius: radius?? 16,
      backgroundImage: const AssetImage('assets/images/profile.jpg'),
    ),
  );
}

Widget notificationButton({Color? color}){
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color ?? MyColors.white,
    ),
    child: Transform.rotate(
      angle: 5.7,
      child: const Icon(
        Icons.notifications,
        color: MyColors.primaryColor,
      ),
    ),
  );
}