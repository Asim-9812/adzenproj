

import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/graph_model.dart';


class BarChartWidget extends StatelessWidget {
  final List<GraphPoints> points;  // List of data points for the bar chart

  const BarChartWidget(this.points, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),  // Padding around the chart
      child: AspectRatio(
        aspectRatio: 16/9,  // Aspect ratio for the chart
        child: BarChart(
          BarChartData(
            minY: 0,  // Minimum value for Y-axis
            maxY: 500,  // Maximum value for Y-axis
            barTouchData: BarTouchData(
              enabled: true,  // Enable touch functionality on the bars
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (touchedSpot) => MyColors.white,  // Tooltip color on touch
              ),
            ),
            borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide.none),  // Chart border styling
            ),
            gridData: const FlGridData(show: false),  // Disable gridlines
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),  // Bottom axis labels
              leftTitles: AxisTitles(sideTitles: _leftTitles),  // Left axis labels
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Disable top axis labels
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Disable right axis labels
            ),
            barGroups: points.map((e) =>  // Create bar groups from the data points
            BarChartGroupData(
              x: e.x.toInt(),  // X-axis value
              barRods: [
                BarChartRodData(
                  backDrawRodData: BackgroundBarChartRodData(
                    toY: 500,  // Background bar height
                    color: MyColors.grey,  // Background color
                    show: true,  // Show background bar
                  ),
                  toY: e.y,  // Y-axis value for each bar
                  color: MyColors.primaryColor,  // Bar color
                  width: 20,  // Width of the bar
                  borderRadius: BorderRadius.zero,  // No border radius for the bars
                ),
              ],
            ),
            ).toList(),  // Convert the list of points to list of bar groups
          ),
        ),
      ),
    );
  }

  // Left axis titles configuration
  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '${value.toInt()}';  // Display the integer value on the left axis
      return Text(text, style: const TextStyle(fontSize: 8));  // Style for the left axis labels
    },
  );

  // Bottom axis titles configuration
  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      // Mapping x-values to months for the bottom axis
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
      }
      return Text(text);  // Return the month name based on the x-value
    },
  );
}
