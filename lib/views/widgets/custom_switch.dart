import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/smart_home_provider.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(this.index,{super.key});

final int index;
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<SmartHomeProvider>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Positioned.directional(
      textDirection: TextDirection.ltr,
      end:0,
      top: deviceSize.height*.04,
      child: CupertinoSwitch(
          dragStartBehavior: DragStartBehavior.down,
          activeColor: Colors.pinkAccent,
          value: homeProvider.switchValues.elementAt(index),
          onChanged: (val) {
            homeProvider.setSwitchValue(val, index);
          }),
    );
  }
}
