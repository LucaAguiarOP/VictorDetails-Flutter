import 'package:flutter/material.dart';
import 'package:victordetailsflutter/src/table_calendar.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});


void CreateNewTask() {

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(148, 0, 0, 1),
        onPressed: CreateNewTask,
        child: const Icon(Icons.add),
        ),
      body: Padding(
        padding: const EdgeInsets.only(top:60),
        child: MyTableCalendar(),
      ),
    );
  }
}
