import 'package:flutter/material.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({Key? key,}) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
          bottom: 10,
          child: Container(
            width: 400,
            height: 600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
