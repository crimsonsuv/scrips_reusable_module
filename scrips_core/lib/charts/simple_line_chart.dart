import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData(
      List<charts.Series<LinearData, int>> data) {
    return SimpleLineChart(
      data,
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList, animate: animate);
  }
}

/// Create one series with sample hard coded data.
List<charts.Series<LinearData, int>> linearChartDataFromList(List items) {
  final data = [];

  for (int i; i < items.length; i++) {
    data.add(LinearData(i, items[i]));
  }

  return [
    new charts.Series<LinearData, int>(
      id: 'Data',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearData sales, _) => sales.x,
      measureFn: (LinearData sales, _) => sales.y,
      data: data,
    )
  ];
}

/// Sample linear data type.
class LinearData {
  final int x;
  final double y;

  LinearData(this.x, this.y);
}
