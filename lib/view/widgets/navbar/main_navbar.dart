import 'package:cs_stream/view/widgets/navbar/navbar.dart';
import 'package:flutter/material.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Navbar(title: 'Asosiy', imageUrl: 'home'),
          Navbar(title: 'Izlash', imageUrl: 'search'),
          Navbar(title: 'Jonli efir', imageUrl: 'live'),
          Navbar(title: 'Video', imageUrl: 'video'),
          Navbar(title: 'Saqlash', imageUrl: 'download'),
        ],
      ),
    );
  }
}
