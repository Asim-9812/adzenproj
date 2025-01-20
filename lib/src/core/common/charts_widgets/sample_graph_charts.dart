



import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/graph_model.dart';


class GraphChartWidget extends StatelessWidget {

  const GraphChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),  // Padding around the chart
      child: AspectRatio(
        aspectRatio: 16/9,  // Aspect ratio for the chart
        child: BarChart(
          BarChartData(
            minY: 0,  // Minimum value for Y-axis
            maxY: 5000,  // Maximum value for Y-axis
            barTouchData: BarTouchData(
              enabled: true,  // Enable touch functionality on the bars
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (touchedSpot) => MyColors.white,  // Tooltip color on touch
              ),
            ),
            borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide()),  // Chart border styling
            ),
            gridData: const FlGridData(show: false),  // Disable gridlines
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),  // Bottom axis labels
              leftTitles: AxisTitles(sideTitles: _leftTitles),  // Left axis labels
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Disable top axis labels
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),  // Disable right axis labels
            ),
            barGroups: [
              BarChartGroupData(
                x: 1,  // X-axis value
                barRods: [
                  BarChartRodData(
                    toY: 3800,  // Y-axis value for each bar
                    color: MyColors.primaryColor,  // Bar color
                    width: 20,  // Width of the bar
                    borderRadius: BorderRadius.zero,  // No border radius for the bars
                  ),
                  BarChartRodData(
                    toY: 5000,  // Y-axis value for each bar
                    color: MyColors.yellow,  // Bar color
                    width: 20,  // Width of the bar
                    borderRadius: BorderRadius.zero,  // No border radius for the bars
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,  // X-axis value
                barRods: [
                  BarChartRodData(
                    toY: 380,  // Y-axis value for each bar
                    color: MyColors.primaryColor,  // Bar color
                    width: 20,  // Width of the bar
                    borderRadius: BorderRadius.zero,  // No border radius for the bars
                  ),
                  BarChartRodData(
                    toY: 500,  // Y-axis value for each bar
                    color: MyColors.yellow,  // Bar color
                    width: 20,  // Width of the bar
                    borderRadius: BorderRadius.zero,  // No border radius for the bars
                  ),
                ],
              ),
            ],  // Convert the list of points to list of bar groups
          ),
        ),
      ),
    );
  }


  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '${value.toInt()}';  // Display the integer value on the left axis
      return Text(text, style: const TextStyle(fontSize: 8));  // Style for the left axis labels
    },
  );


  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      // Mapping x-values to months for the bottom axis
      switch (value.toInt()) {
        case 1:
          text = 'Orders';
          break;
        case 2:
          text = 'Tasks';
          break;
      }
      return Text(text);  // Return the month name based on the x-value
    },
  );
}
