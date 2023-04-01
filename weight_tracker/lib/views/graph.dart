import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:weight_tracker/models/record.dart';
import 'package:weight_tracker/view-models/controller.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Graph"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.3,
          child: Column(
            children: [
              Expanded(child: LineChart(chartData)),
              TextButton(onPressed: null, child: Text("deneme"))
            ],
          ),
        ),
      ),
    );
  }

  LineChartData chartData = LineChartData(
    maxX: 7,
    minX: 0,
    maxY: 100,
    minY: 70,
    // Grafik eksenlerinin özelliklerini ayarlayın
    gridData: FlGridData(
      show: true,
      // x ekseninde çizgi sayısını belirleyin
      horizontalInterval: 5,
      // y ekseninde çizgi sayısını belirleyin
      verticalInterval: 5,
    ),
    // x ve y eksenlerinin stilini ayarlayın
    axisTitleData: FlAxisTitleData(
      leftTitle: AxisTitle(
        margin: 10,
      ),
      bottomTitle: AxisTitle(
        showTitle: true,
        titleText: 'Days',
        textStyle: TextStyle(fontSize: 16),
        margin: 10,
      ),
    ),
    // Grafik çizgilerini ayarlayın
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 85),
          FlSpot(1, 81),
          FlSpot(2, 82),
          FlSpot(3, 82),
          FlSpot(4, 83),
          FlSpot(5, 85),
        ],
        barWidth: 1,
        colors: [Colors.black12],
        belowBarData: BarAreaData(
          show: true,
          colors: [Colors.blue.withOpacity(0.3)],
        ),
      ),
    ],
  );
}
