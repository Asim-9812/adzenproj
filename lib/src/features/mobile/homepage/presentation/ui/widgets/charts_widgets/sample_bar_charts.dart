

import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/data/model/graph_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartWidget extends StatelessWidget {
  final List<GraphPoints> points;

  const BarChartWidget(this.points,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: BarChart(
          BarChartData(
            minY: 0,
            maxY: 500,
            barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (touchedSpot) => MyColors.white,
                )
            ),
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide.none)),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: _leftTitles),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            barGroups: points.map((e)=>
                BarChartGroupData(
                    x: e.x.toInt(),
                  barRods: [
                    BarChartRodData(
                      backDrawRodData: BackgroundBarChartRodData(
                        toY: 500,
                        color: MyColors.grey,
                        show: true
                      ),
                      toY: e.y,
                      color: MyColors.primaryColor,
                      width: 20,
                      borderRadius: BorderRadius.zero,
                    )
                  ],
                )).toList()
          )
        ),
      ),
    );
  }

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '${value.toInt()}';

      return Text(text,style: TextStyle(fontSize: 8),);
    },
  );

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = '';
          break;
        case 1:
          text = 'Jul';
          break;
        case 2:
          text = 'Aug';
          break;
        case 3:
          text = 'Sep';
          break;
        case 4:
          text = 'Oct';
          break;
        case 5:
          text = 'Nov';
          break;
        case 6:
          text = 'Dec';
          break;
        // case 7:
        //   text = 'Jul';
        //   break;
        // case 9:
        //   text = 'Sep';
        //   break;
        // case 11:
        //   text = 'Nov';
        //   break;
      }

      return Text(text);
    },
  );
}