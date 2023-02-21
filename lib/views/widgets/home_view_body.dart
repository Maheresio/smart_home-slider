import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/smart_home_provider.dart';
import 'list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<SmartHomeProvider>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: ListView.separated(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ListViewItem(index),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: homeProvider.homeItems.length,
        ),
      ),
    );
  }
}
