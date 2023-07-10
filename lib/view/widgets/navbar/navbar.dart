import 'package:cs_stream/view/screens/home_screen.dart';
import 'package:cs_stream/view/screens/live_screen.dart';
import 'package:cs_stream/view/screens/save_screen.dart';
import 'package:cs_stream/view/screens/search_screen.dart';
import 'package:cs_stream/view/screens/video_screen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final String title;
  final String imageUrl;

  const Navbar({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.title.contains('Asosiy')) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } else if (widget.title.contains('Izlash')) {
          Navigator.of(context).pushNamed(SearchScreen.routeName);
        }else if (widget.title.contains('Jonli efir')) {
          Navigator.of(context).pushNamed(LiveScreen.routeName);
        }else if (widget.title.contains('Video')) {
          Navigator.of(context).pushNamed(VideoScreen.routeName);
        }else if (widget.title.contains('Saqlash')) {
          Navigator.of(context).pushNamed(SaveScreen.routeName);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/icons/${widget.imageUrl}.png',
              height: 22,
              width: 22,
              fit: BoxFit.cover,
              // color: Colors.white,
            ),
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
