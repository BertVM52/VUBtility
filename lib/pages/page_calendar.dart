import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:vubtility/theme/app_colors.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({ Key? key }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}


class _CalendarPageState extends State<CalendarPage> {

  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooster'),
        backgroundColor: primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SfCalendar(
        controller: _calendarController,
        view: CalendarView.workWeek,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          border: Border.all(color: secondaryColor, width: 1),
        ),
        todayHighlightColor: Colors.blue,
        showNavigationArrow: true,
        showWeekNumber: true,
        allowedViews: const <CalendarView>[
          CalendarView.timelineDay,
          CalendarView.workWeek,
          CalendarView.month
        ],
      ),
    );
  }
}