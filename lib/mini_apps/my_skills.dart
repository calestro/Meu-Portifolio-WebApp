import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:port_leonir/config/languages_icon_icons.dart';
import 'package:port_leonir/mini_apps/animation_bar.dart';
import 'dart:math' as math;

import 'package:port_leonir/mini_apps/functions.dart';

import 'bar_data.dart';

class GraphMySkill extends StatefulWidget {
  const GraphMySkill({Key? key}) : super(key: key);


  static const dataList = [
    BarData(Color(0xFFecb206), 20, LanguagesIcon.python),
    BarData(Color(0xFFa8bd1a), 17,Icons.e_mobiledata),
    BarData(Color(0xFF17987b), 10,Icons.abc),
    BarData(Color(0xFFb87d46), 2.5,Icons.abc),
    BarData(Color(0xFF295ab5), 2,Icons.abc),
    BarData(Color(0xFFea0107), 2,Icons.abc),
  ];

  @override
  State<GraphMySkill> createState() => _GraphMySkillState();
}

class _GraphMySkillState extends State<GraphMySkill> {


  BarChartGroupData generateBarGroup(
      int x,
      Color color,
      double value,

      ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {

    MyFunctions functions = MyFunctions();
    double wd = MediaQuery.of(context).size.width;
    double hg = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      elevation: 4,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment:Alignment.center,child: Text("My Skills", textAlign: TextAlign.center)),
              SizedBox(height: hg * 0.05),
              AspectRatio(
                aspectRatio: wd / 500,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    borderData: FlBorderData(
                      show: true,
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFececec),
                        ),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        drawBehindEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Color(0xFF606060),
                              ),
                              textAlign: TextAlign.left,
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 36,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: IconWidget(
                                color: GraphMySkill.dataList[index].color,
                                isSelected: touchedGroupIndex == index,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    //Linhas background do gráfico
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: const Color(0xFFececec),
                        dashArray: null,
                        strokeWidth: 1,
                      ),
                    ),

                    //setando cores no grafico
                    barGroups: GraphMySkill.dataList.asMap().entries.map((e) {
                      final index = e.key;
                      final data = e.value;
                      final color = Colors.green;
                      return generateBarGroup(
                        index,
                        touchedGroupIndex == e.key ? color : data.color,
                        data.value,);
                    }).toList() ,
                    maxY: 100,

                    //OnHover
                    barTouchData: BarTouchData(
                      enabled: true,
                      handleBuiltInTouches: false,
                      touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipMargin: 0,

                          // definindo o nomes das variaveis
                          getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                              ) {


                            return BarTooltipItem(
                              rod.toY.toString(),
                              TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: rod.color!,
                                  fontSize: 18,
                                  shadows: const [
                                    Shadow(
                                      color: Colors.black26,
                                      blurRadius: 12,
                                    )
                                  ]),
                            );
                          }),

                      // se o item for hovered
                      touchCallback: (event, response) {
                        if (event.isInterestedForInteractions &&
                            response != null &&
                            response.spot != null) {
                          setState(() {
                            touchedGroupIndex =
                                response.spot!.touchedBarGroupIndex;
                          });
                        } else {
                          setState(() {
                            touchedGroupIndex = -1;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}



