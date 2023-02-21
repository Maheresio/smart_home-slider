import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../view_model/smart_home_provider.dart';

class Content extends StatelessWidget {
  const Content(this.index, {super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final homeProvider = Provider.of<SmartHomeProvider>(context);

    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * .1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceSize.width * .1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    homeProvider.homeItems.elementAt(index).icon,
                    color: homeProvider.sliderValues.elementAt(index) == 0
                        ? Colors.red
                        : AppColors.darkBlue,
                  ),
                  SizedBox(
                    height: deviceSize.height * .02,
                  ),
                  Text(
                    homeProvider.switchValues.elementAt(index)
                        ? '${homeProvider.sliderValues.elementAt(index).round()}%'
                        : 'Off',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sf',
                        fontSize: MediaQuery.of(context).textScaleFactor * 15),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  homeProvider.homeItems.elementAt(index).location,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor * 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * .005,
                ),
                Text(homeProvider.homeItems.elementAt(index).power,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 16,
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const Spacer(),
            CupertinoSwitch(
                dragStartBehavior: DragStartBehavior.down,
                activeColor: Colors.pinkAccent,
                value: homeProvider.switchValues.elementAt(index),
                onChanged: (val) {
                  homeProvider.setSwitchValue(val, index);
                }),
          ],
        ),
      ),
    );
  }
}
