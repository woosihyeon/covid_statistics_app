import 'package:covid_statistics_app/src/models/covid_statistics.dart';
import 'package:covid_statistics_app/src/utils/data_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<Covid19StatisticsModel> covidDatas;
  final double maxY;
  const CovidBarChart({Key? key,required this.covidDatas,required this.maxY}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int x =0;
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipMargin: 8,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                rod.y.round().toString(),
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            margin: 20,
            getTitles: (double value) {
              return DataUtils.simpleDayFormat(covidDatas[value.toInt()].stateDt!);
            },
          ),
          leftTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: this.covidDatas.map<BarChartGroupData>((covidData){
            return BarChartGroupData(
            x: x++,
            barRods: [
              BarChartRodData(
                  y: covidData.calcDecideCnt, colors: [Colors.black])
            ],
            showingTooltipIndicators: [0],
          );
        }).toList(),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY * 1.5,
      ),
    );
  }
}
