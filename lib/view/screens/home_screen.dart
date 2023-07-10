import 'dart:math';

import 'package:cs_stream/view/widgets/home/my_app_bar.dart';
import 'package:cs_stream/view/widgets/home/video_list.dart';
import 'package:cs_stream/view/widgets/navbar/main_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyAppBar(),
          VideoList(
            query: "CS GO",
          ),
        ],
      ),
      bottomNavigationBar: const MainNavbar(),
    );
  }
}
