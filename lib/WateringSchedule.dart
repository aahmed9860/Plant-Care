import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vm_service/utils.dart';
class WateringSchedule extends StatefulWidget {
  const WateringSchedule({super.key});

  @override
  State<WateringSchedule> createState() => _WateringScheduleState();
}

class _WateringScheduleState extends State<WateringSchedule> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Navigation(),
       appBar: AppBar(
        title: Text('Watering Schedule'),
        backgroundColor: Colors.blue,
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2024, 1, 01),
        lastDay: DateTime.utc(2024, 12, 30),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}