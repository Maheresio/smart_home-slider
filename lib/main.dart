import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/smart_home_provider.dart';

import 'app_constants.dart';
import 'views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => SmartHomeProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
            scaffoldBackgroundColor: AppColors.darkBlue,
          ),
          home: const HomeView(),
        )),
  );
}
