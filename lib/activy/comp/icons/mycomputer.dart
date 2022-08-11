import 'package:flutter/material.dart';
import 'package:port_leonir/activy/comp/icons/hovered.dart';


class MyComputerIcon extends StatelessWidget {
  final image;
  final iconFunction;
  final String textIcon;
  const MyComputerIcon({Key? key,required this.image, required this.iconFunction, required this.textIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: GestureDetector(
        child: Container(
          color: Colors.transparent,
          child: OnHovered(
            child: Column(
              children: [
                Image.asset(image, width: 60,),
                Text(textIcon, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
