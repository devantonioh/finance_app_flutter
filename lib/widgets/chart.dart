import 'package:finance_app/data/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/add_date.dart';

class Chart extends StatefulWidget {
  int indexx;
  Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();
        j = false;
        break;
      default:
    }
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData(100, 'Mon'),
              SalesData(75, 'Tue'),
              SalesData(80, 'Wed'),
              SalesData(42, 'Thu'),
              SalesData(15, 'Fri'),
              SalesData(50, 'Sat'),
              SalesData(5, 'Sun'),
              /*  ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                  j
                      ? b
                          ? a![index].dateTime.hour.toString()
                          : a![index].dateTime.day.toString()
                      : a![index].dateTime.month.toString(),
                  b
                      ? index > 0
                          ? time(a!, true)[index] + time(a!, true)[index - 1]
                          : time(a!, true)[index]
                      : index > 0
                          ? time(a!, false)[index] + time(a!, false)[index - 1]
                          : time(a!, false)[index],
                );
              }) */
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.sales, this.year);
  final String year;
  final int sales;
}
