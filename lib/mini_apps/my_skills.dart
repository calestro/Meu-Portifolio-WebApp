import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:port_leonir/mini_apps/functions.dart';


class MySkillApp extends StatefulWidget {
  const MySkillApp({Key? key}) : super(key: key);

  @override
  State<MySkillApp> createState() => _MySkillAppState();
}

class _MySkillAppState extends State<MySkillApp> {
  @override
  Widget build(BuildContext context) {
    MyFunctions system = MyFunctions();
    return Column(
      children: [

        //Grafico
        AspectRatio(
            aspectRatio: 1,
          child: PieChart(
           PieChartData(
             sectionsSpace:5,
             centerSpaceRadius: 110,
             sections: system.graphLoad(),
           )
          )

        ),
      ],
    );
  }
}
