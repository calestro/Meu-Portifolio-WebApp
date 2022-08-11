import 'package:flutter/material.dart';
import 'package:port_leonir/activy/big_device/icons/hovered.dart';


class StartIcon extends StatelessWidget {
  const StartIcon({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final BoxDecoration startBox = BoxDecoration(
      color: Color(0xff549a82),
      border: Border.all(
        color: Color(0xff498a74),
        width: 5.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
    );

    final BoxDecoration startBoxHover = BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: Colors.transparent,
        width: 5.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
    );

    return Stack(
      children: [
        Container(
          height: 40,
          width: 115,
          decoration:startBox,
          child: Center(
              child: Text("START", style: TextStyle(color: Colors.white),
              )),
        ),
        OnHovered(
          type: "start",
          child: Container(
            height: 40,
            width: 115,
            decoration:startBoxHover,),
        ),
      ],
    );
  }
}
