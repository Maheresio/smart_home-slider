import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_animated_container.dart';

import 'content.dart';
import 'custom_slider.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAnimatedContainer(index),
        Content(index),
        CustomSlider(index),
      ],
    );
  }
}
