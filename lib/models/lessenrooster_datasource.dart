import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:vubtility/models/vak.dart';

class LessenroosterDataSource extends CalendarDataSource {
  LessenroosterDataSource(List<Vak> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.fromMillisecondsSinceEpoch(appointments![index].from);
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.fromMillisecondsSinceEpoch(appointments![index].to);
  }

  @override
  String getSubject(int index) {
    return appointments![index].className;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }
}
