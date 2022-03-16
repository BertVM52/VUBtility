import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:vubtility/models/lessenrooster_datasource.dart';
import 'package:vubtility/models/vak.dart';
import 'package:vubtility/theme/app_colors.dart';
import 'package:intl/intl.dart';

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


  List<Vak> _getDummyData() {
    final List<Vak> vakken = <Vak>[];
    final DateTime today = DateTime.now();

    final List<String> classNames = <String>['Algoritmen en Datastructuren', 'Logica', 'Calculus', 'Structuur van Computerprogrammas', 'Interpretatie van Computerprogrammas'];
    final List<String> profNames = <String>['Wolfgang Demeuter', 'Olga De Troyer', 'Dominic Maes', 'Viviane Jonckers', 'Coen De Roover'];

    // add 5 random vakken
    for (int i = 0; i < 5; i++) {

      final DateTime startTime = DateTime(today.year, today.month, today.day, 9+(2*i), 0, 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));

      vakken.add(
        Vak(id: i, className: classNames[i], from: startTime.millisecondsSinceEpoch, to: endTime.millisecondsSinceEpoch, profName: profNames[i], location: 'E.0.$i', color: secondaryColor)
      );
    }
    return vakken;
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Vak vak = details.appointments![0];
      final String className = vak.className;
      final String profName = vak.profName;
      final String location = vak.location;
      final String from = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(vak.from)).toString();
      final String to = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(vak.to)).toString();

      print('className: $className\nprofName: $profName\nlocation: $location\nfrom: $from\nto: $to');
    }
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
        dataSource: LessenroosterDataSource(_getDummyData()),
        view: CalendarView.workWeek,
        onTap: calendarTapped,
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