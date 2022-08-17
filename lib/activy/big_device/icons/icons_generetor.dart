// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'hovered.dart';



class IconGenerator extends StatelessWidget {

  final String image;
  final iconFunction;
  final String textIcon;
  final size;

  const IconGenerator({Key? key,required this.image, required this.iconFunction, required this.textIcon, this.size = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: GestureDetector(
        onDoubleTap: iconFunction,
        child: Container(
          color: Colors.transparent,
          child: OnHovered(
            type: "icon",
            size: size,
            child: Column(
              children: [
                Image.asset(image, width: size),
                textIcon != "" ? const SizedBox(height: 10) : Container(),
                textIcon != "" ? Text(textIcon, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
