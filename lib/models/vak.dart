import 'package:flutter/material.dart';

class Vak {
  Vak({
    required this.id,
    required this.className,
    required this.from,
    required this.to,
    required this.profName,
    required this.location,
    required this.color
  });

  factory Vak.fromMap(Map<String, dynamic> data) => Vak(
    id: data['id'] as int,
    className: data['class_name'] as String,
    from: data['from'] as int,
    to: data['to'] as int,
    profName: data['prof_name'] as String,
    location: data['location'] as String,
    color: data['color'] as Color,
  );

  int id;
  String className;
  int from;
  int to;
  String profName;
  String location;
  Color color;

  bool equals(Vak other) {
    return id == other.id;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'class_name': className,
      'from': from,
      'to': to,
      'prof_name': profName,
      'location': location,
      'color': color
    };
  }
}