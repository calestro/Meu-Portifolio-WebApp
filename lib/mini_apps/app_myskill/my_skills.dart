import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:port_leonir/mini_apps/app_myskill/icon_animated.dart';
import 'package:port_leonir/mini_apps/app_myskill/skill_app_data.dart';


class GraphMySkill extends StatefulWidget {
  const GraphMySkill({Key? key}) : super(key: key);




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
          width: 30,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {

    double wd = MediaQuery.of(context).size.width;
    double hg = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: hg * 0.05),
                AspectRatio(
                  aspectRatio: (wd + hg) / 900,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,

                      borderData: FlBorderData(
                        show: true,
                        border: const Border.symmetric(
                          horizontal: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                        ),
                        leftTitles: AxisTitles(
                          drawBehindEverything: false,
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
                                  color: AppData.dataList[index].color,
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
                          color: Colors.black12,
                          dashArray: null,
                          strokeWidth: 1,
                        ),
                      ),

                      //setando cores no grafico
                      barGroups: AppData.dataList.asMap().entries.map((e) {
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
                SizedBox(height: hg * 0.02,),
                //SizedBox(
                //height: 300,
                //child: DescriptionLanguage(index: touchedGroupIndex)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}



