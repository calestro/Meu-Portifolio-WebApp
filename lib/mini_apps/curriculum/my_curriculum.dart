import 'package:flutter/material.dart';

import 'arrow_container_painter.dart';



class MyCurriculum extends StatefulWidget {
  const MyCurriculum({Key? key}) : super(key: key);

  @override
  State<MyCurriculum> createState() => _MyCurriculumState();
}

class _MyCurriculumState extends State<MyCurriculum> {
  @override
  Widget build(BuildContext context) {
    double wd = MediaQuery.of(context).size.width;
    double hg = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Text("Leonir Júnior"),
        Text("Ribeiro Calestro"),
        CircleAvatar(
          child: Image.asset("img/git.png"),
        ),
        CustomPaint(
          painter: arrowContainer(false),
          child: Container(
            width: wd/3,
            height: 120.0,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Introdução", style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
