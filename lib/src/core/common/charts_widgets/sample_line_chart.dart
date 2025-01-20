import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/graph_model.dart';


class LineChartWidget extends StatelessWidget {
  final List<GraphPoints> points;
  final List<GraphPoints> points2;

  const LineChartWidget(this.points, this.points2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16/9,  // Maintain 16:9 aspect ratio for the chart
        child: LineChart(
          LineChartData(
            minY: 600000,
            maxY: 1000000,
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => MyColors.white, // Tooltip color on touch
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: false, // Line is not curved
                dotData: const FlDotData(
                  show: true, // Show data points as dots
                ),
                color: MyColors.primaryColor,  // Line color for the first dataset
              ),
              LineChartBarData(
                  spots: points2.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: false, // Line is not curved
                  dotData: const FlDotData(
                    show: true, // Show data points as dots
                  ),
                  color: MyColors.red  // Line color for the second dataset
              ),
            ],
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide.none)),  // Border for the chart
            gridData: const FlGridData(show: true),  // Show grid lines
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),  // Bottom axis labels (Months)
              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Hide left axis titles
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Hide top axis titles
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Hide right axis titles
            ),
          ),
        ),
      ),
    );
  }

  // Left axis labels (Y-axis)
  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '${value.toInt()}';  // Convert Y-axis values to integers for display
      return Text(text, style: const TextStyle(fontSize: 8));  // Display with smaller font size
    },
  );

  // Bottom axis labels (X-axis - Months)
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
