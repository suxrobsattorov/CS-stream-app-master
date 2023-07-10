import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 5,
        right: 10,
        left: 10,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/Live-me-App.png',
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              const Text(
                'CS',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 35,
                width: 35,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/icons/bell.png',
                  height: 10,
                  width: 10,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 18,
                width: 18,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: const Center(
                  child: Text(
                    '79',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
