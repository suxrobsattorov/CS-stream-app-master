import 'dart:math';

import 'package:cs_stream/view/widgets/home/my_app_bar.dart';
import 'package:cs_stream/view/widgets/home/video_list.dart';
import 'package:cs_stream/view/widgets/navbar/main_navbar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const routeName = '/search_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Izlash'),
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
