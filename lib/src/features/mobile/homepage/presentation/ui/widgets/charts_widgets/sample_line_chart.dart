import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/data/model/graph_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class LineChartWidget extends StatelessWidget {
  final List<GraphPoints> points;
  final List<GraphPoints> points2;

  const LineChartWidget(this.points,this.points2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: LineChart(
          LineChartData(
            minY: 600000,
            maxY: 1000000,
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => MyColors.white,
              )
            ),
            lineBarsData: [
              LineChartBarData(
                  spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: false,
                  dotData: FlDotData(
                    show: true,
                  ),
                  color: MyColors.primaryColor,
              ),
              LineChartBarData(
                  spots: points2.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: false,
                  dotData: FlDotData(
                    show: true,
                  ),
                  color: MyColors.red
              ),
            ],
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide.none)),
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
          ),
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
          text = 'Jan';
          break;
        case 3:
          text = 'Mar';
          break;
        case 5:
          text = 'May';
          break;
        case 7:
          text = 'Jul';
          break;
        case 9:
          text = 'Sep';
          break;
        case 11:
          text = 'Nov';
          break;
      }

      return Text(text);
    },
  );
}