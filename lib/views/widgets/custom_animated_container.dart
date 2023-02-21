import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../view_model/smart_home_provider.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer(this.index, {super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final homeProvider = Provider.of<SmartHomeProvider>(context);
    const double rad = 40;

    return AnimatedContainer(
      width: homeProvider.switchValues.elementAt(index)
          ? homeProvider.calculateWidth(deviceSize, index)
          : deviceSize.width,
      height: deviceSize.height * .13,
      decoration: BoxDecoration(
          color: homeProvider.switchValues.elementAt(index)
              ? Colors.white
              : AppColors.darkGrey,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(rad),
            topLeft: Radius.circular(rad),
            topRight: Radius.circular(rad),
          )),
      duration: Duration(
          milliseconds: homeProvider.switchValues.elementAt(index) ? 50 : 400),
      curve: homeProvider.switchValues.elementAt(index)
          ? Curves.fastOutSlowIn
          : Curves.easeInOutQuad,
    );
  }
}
