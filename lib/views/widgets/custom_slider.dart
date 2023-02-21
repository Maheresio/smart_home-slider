import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/smart_home_provider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider(this.index, {super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final homeProvider = Provider.of<SmartHomeProvider>(context);

    return Positioned.fill(
      left: deviceSize.width * .1,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: deviceSize.width * .24),
        child: Opacity(
            opacity: 0,
            child: AbsorbPointer(
              absorbing:
                  homeProvider.switchValues.elementAt(index) ? false : true,
              child: Slider(
                min: 0,
                max: 100,
                value: homeProvider.sliderValues.elementAt(index),
                onChanged: (val) {
                  homeProvider.setSliderValue(val, index);
                },
              ),
            )),
      ),
    );
  }
}
