import 'dart:math';

import 'package:cs_stream/view/widgets/home/my_app_bar.dart';
import 'package:cs_stream/view/widgets/home/video_list.dart';
import 'package:cs_stream/view/widgets/navbar/main_navbar.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  static const routeName = '/save_screen';

  Widget _getImage(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.asset(
        'assets/images/csgo$index.jpg',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Saqlash'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Malumotlar topilmadi',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _getImage(1),
            _getImage(2),
            _getImage(3),
            _getImage(4),
            _getImage(5),
            _getImage(6),
            _getImage(7),
            _getImage(8),
            _getImage(9),
          ],
        ),
      ),
      bottomNavigationBar: const MainNavbar(),
    );
  }
}
