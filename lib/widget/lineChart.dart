import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
          LineChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              lineBarsData: [
                LineChartBarData(
                    spots: getSpots(),
                    isCurved: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    colors: [Colors.green],
                    barWidth: 4
                )
              ]
          )
      ) ,
    );
  }

  List<FlSpot> getSpots(){
    return [
      FlSpot(0, 0.0),
      FlSpot(1, 1.2),
      FlSpot(2, 0.2),
      FlSpot(3, 1.0),
      FlSpot(4, 0.5),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
  }
}
