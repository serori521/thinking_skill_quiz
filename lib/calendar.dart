import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<dynamic>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _events[DateTime.now()] = ['Quiz Completed'];
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      eventLoader: _getEventsForDay,
      calendarStyle: CalendarStyle(
        markerDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
