import 'package:flutter/material.dart';

class HomeModel {
  final String location;
  final String power;
  final IconData icon;

  HomeModel({
    required this.location,
    required this.power,
    required this.icon,
  });

  factory HomeModel.fromJson(Map json) => HomeModel(
        location: json['location'],
        power: json['power'],
        icon: json['icon'],
      );
}
