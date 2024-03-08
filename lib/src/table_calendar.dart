import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

class MyTableCalendar extends StatefulWidget {
  const MyTableCalendar({super.key});

  @override
  State<MyTableCalendar> createState() => _MyTableCalendarState();
}

class _MyTableCalendarState extends State<MyTableCalendar> {
  final _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logovitor2.png',
          width: 250,
        ),
        Padding(
          padding: const EdgeInsets.all(60),
          child: TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            locale: AppLocalizations.of(context)!.localeName,
            headerStyle: const HeaderStyle(
              leftChevronPadding: EdgeInsets.only(left: 30),
              rightChevronPadding: EdgeInsets.only(right: 30),
              headerPadding: EdgeInsets.only(bottom: 20),
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white),
            ),
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
