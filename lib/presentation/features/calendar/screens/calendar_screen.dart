import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcnc_todo_task/core/constants/palette.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calendar_screen_controller.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarScreenController controller =
      Get.put(CalendarScreenController(Get.find()));

  CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Calendar'),
          centerTitle: true,
          backgroundColor: Palette.bgColor),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            eventLoader: (day) {
              return controller.tasksByDate[day] ?? [];
            },
          ),
          // Expanded(
          //   child: TaskSlider(), // Your task slider widget
          // ),
        ],
      ),
    );
  }
}
