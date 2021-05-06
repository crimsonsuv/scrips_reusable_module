import 'package:charts_flutter/flutter.dart' as charts;
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum GraphType { lengthForAge, weightForAge, lengthToWeight, headCircumForAge }

class GrowthChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GrowthChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        animate: animate,
        domainAxis: new charts.NumericAxisSpec(
            showAxisLine: true,
            tickProviderSpec:
                new charts.BasicNumericTickProviderSpec(zeroBound: false)),
        primaryMeasureAxis: new charts.NumericAxisSpec(
            showAxisLine: true,
            tickProviderSpec:
                new charts.BasicNumericTickProviderSpec(zeroBound: false)));
  }

  /// Create series with csv data.
  static Future<List<charts.Series<LinearGraphData, double>>>
      createGraphPercentileData(
          GraphType type, List<LinearGraphData> patientData, String patientGender, bool isDefaultMetric) async {
    var graphData;
    List<List<dynamic>> dataRows;
    Map<String, List<LinearGraphData>> categories = {};
    int gender = (patientGender == "Male") ? 1 : 2;
    switch (type) {
      case GraphType.weightForAge:
        graphData = await rootBundle
            .loadString('assets/growth_graph_data/wtageinf.csv');
        dataRows = const CsvToListConverter(eol: "\n").convert(graphData);
        for (int i = 5; i < dataRows.first.length; i++) {
          List<LinearGraphData> items = [];

          for (int j = 1; j < dataRows.length; j++) {
            if (dataRows[j][0] == gender)
              items.add(LinearGraphData(
                  dataRows[j][1] is int
                      ? dataRows[j][1].toDouble()
                      : dataRows[j][1],
                  isDefaultMetric ? dataRows[j][i] : dataRows[j][i]*2.205));
          }

          categories[dataRows[0][i]] = items;
        }
        break;
      case GraphType.lengthForAge:
        graphData = await rootBundle
            .loadString('assets/growth_graph_data/lenageinf.csv');
        dataRows = const CsvToListConverter(eol: "\n").convert(graphData);
        for (int i = 5; i < dataRows.first.length; i++) {
          List<LinearGraphData> items = [];

          for (int j = 1; j < dataRows.length; j++) {
            if (dataRows[j][0] == gender)
              items.add(LinearGraphData(
                  dataRows[j][1] is int
                      ? dataRows[j][1].toDouble()
                      : dataRows[j][1],
                  isDefaultMetric ? dataRows[j][i] : dataRows[j][i]/2.54));
          }

          categories[dataRows[0][i]] = items;
        }
        break;
      case GraphType.lengthToWeight:
        graphData = await rootBundle
            .loadString('assets/growth_graph_data/wtleninf.csv');
        dataRows = const CsvToListConverter(eol: "\n").convert(graphData);
        for (int i = 5; i < dataRows.first.length; i++) {
          List<LinearGraphData> items = [];

          for (int j = 1; j < dataRows.length; j++) {
            if (dataRows[j][0] == gender)
              items.add(LinearGraphData(
                  isDefaultMetric ? dataRows[j][1] is int
                      ? dataRows[j][1].toDouble()
                      : dataRows[j][1] : dataRows[j][1] is int
                      ? dataRows[j][1].toDouble()/2.54
                      : dataRows[j][1]/2.54,
                  isDefaultMetric ? dataRows[j][i] : dataRows[j][i]*2.205));
          }

          categories[dataRows[0][i]] = items;
        }
        break;
      case GraphType.headCircumForAge:
        graphData = await rootBundle
            .loadString('assets/growth_graph_data/hcageinf.csv');
        dataRows = const CsvToListConverter(eol: "\n").convert(graphData);
        for (int i = 5; i < dataRows.first.length; i++) {
          List<LinearGraphData> items = [];

          for (int j = 1; j < dataRows.length; j++) {
            if (dataRows[j][0] == gender)
              items.add(LinearGraphData(
                  dataRows[j][1] is int
                      ? dataRows[j][1].toDouble()
                      : dataRows[j][1],
                  isDefaultMetric ? dataRows[j][i] : dataRows[j][i]/2.54));
          }

          categories[dataRows[0][i]] = items;
        }
        break;
      default:
        print("No Data provided");
    }

    List<charts.Series<LinearGraphData, double>> seriesData;

    seriesData = categories.keys
        .map((e) => charts.Series<LinearGraphData, double>(
              id: e.toString(),
              dashPatternFn: (LinearGraphData axisData, _) => [3, 3],
              colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
              domainFn: (LinearGraphData axisData, _) => axisData.yaxis,
              measureFn: (LinearGraphData axisData, _) => axisData.xaxis,
              data: categories[e],
            ))
        .toList();

    if (patientData.length > 0) {
      seriesData.add(charts.Series<LinearGraphData, double>(
        id: "pData",
        strokeWidthPxFn: (_, __) => 3,
        colorFn: (_, __) => (gender == 1) ? charts.MaterialPalette.indigo.shadeDefault : charts.MaterialPalette.pink.shadeDefault.lighter,
        domainFn: (LinearGraphData axisData, _) => axisData.yaxis,
        measureFn: (LinearGraphData axisData, _) => axisData.xaxis,
        data: patientData,
      ));
    }

    return seriesData;
  }
}

/// Sample linear data type.
class LinearGraphData {
  final double yaxis;
  final double xaxis;

  LinearGraphData(this.yaxis, this.xaxis);
}
