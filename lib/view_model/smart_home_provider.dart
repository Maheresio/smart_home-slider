import 'package:flutter/material.dart';

import '../models/home_model.dart';

class SmartHomeProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _homeItems = [
    {
      'location': 'Living Room',
      'power': '8.5 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Kitchen',
      'power': '4.6 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Bedroom',
      'power': '7.2 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Living Room',
      'power': '8.5 Kwh',
      'icon': Icons.lightbulb_outline
    },
    {
      'location': 'Bedroom',
      'power': '7.2 Kwh',
      'icon': Icons.lightbulb_outline
    },
  ];

  late final homeItems = _homeItems.map((e) => HomeModel.fromJson(e)).toList();

  late List<double> sliderValues =
      List<double>.generate(homeItems.length, (int index) => 100);
  late List<bool> switchValues =
      List<bool>.generate(homeItems.length, (int index) => true);

  void setSliderValue(double value, int index) {
    sliderValues[index] = value;
    notifyListeners();
  }

  void setSwitchValue(bool value, int index) {
    switchValues[index] = value;
    notifyListeners();
  }

  double calculateWidth(Size deviceSize, int index) {
    return deviceSize.width * .40 * (sliderValues.elementAt(index) / 100) +
        deviceSize.width * .22;
  }
}
