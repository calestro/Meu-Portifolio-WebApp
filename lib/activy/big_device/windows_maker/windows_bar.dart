import 'package:flutter/material.dart';


class WindowsBar extends StatelessWidget {
  final bool isbarTopConfig;
  final Widget child;
  final bool isMaximize;

  const WindowsBar({Key? key, required this.isbarTopConfig,required this.child, this.isMaximize = false}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    double wd = MediaQuery.of(context).size.width;
    double hg = MediaQuery.of(context).size.height;
    BoxDecoration windowsBar = BoxDecoration(color: Colors.white10, );

    return Column(
      children: [
        Container(
          width: wd * 0.5,
          height: hg * 0.5,
          decoration: windowsBar,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //icon close
              //icon maximize
              //icon minimize

              ],
          ),
        ),

        Container(
          width: wd * 0.5,
          height: hg * 0.5,
        )
      ],
    );
  }
}
