import 'dart:math';

import 'package:cs_stream/view/widgets/home/my_app_bar.dart';
import 'package:cs_stream/view/widgets/home/video_list.dart';
import 'package:cs_stream/view/widgets/navbar/main_navbar.dart';
import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  static const routeName = '/live_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jonli efir'),
      ),
      body: Column(
        children: [
          VideoList(
            query: "CS GO",
          ),
        ],
      ),
      bottomNavigationBar: const MainNavbar(),
    );
  }
}
