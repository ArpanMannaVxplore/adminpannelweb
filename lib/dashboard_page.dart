import 'dart:math';
import 'package:adminpannelweb/side_menubar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as newPieChart;
import 'package:responsive_framework/responsive_framework.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;

  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, double> dataMap = {
    "Correct Answer": 25.00,
    "Wrong Answer": 15.00,
    "Unattempted": 45.00,
  };

  // Colors for each segment
  // of the pie chart
  List<Color> colorList = [
    const Color(0xff3EE094),
    const Color(0xffFA4A42),
    const Color(0xFF16246D)
  ];

  // List of gradients for the
  // background of the pie chart
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });
  final List<DataItem> _myData = List.generate(
      30,
      (index) => DataItem(
            x: index,
            y1: Random().nextInt(20) + Random().nextDouble(),
            y2: Random().nextInt(20) + Random().nextDouble(),
            y3: Random().nextInt(20) + Random().nextDouble(),
          ));
  List<Map<String, dynamic>> messages = [
    {
      "user_name": "Anil Das",
      "message": "When will delivered?",
      "status": "pending",
      "time": "11:40 PM"
    },
    {
      "user_name": "Asit Mondal",
      "message": "When will shifted?",
      "status": "answered",
      "time": "9:40 AM"
    },
    {
      "user_name": "Dipak Dey",
      "message": "xzbvcbdsfszfgsvssdav",
      "status": "pending",
      "time": "1:20 PM"
    },
    {
      "user_name": "Anindya Bagchi",
      "message": "qewrtuyjifkgtbcb",
      "status": "pending",
      "time": "5:00 AM"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffcceeff),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Admin Panel",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Text(
              "Welcome back, Arpan",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            ResponsiveRowColumn(
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: const EdgeInsets.all(30),
              columnPadding: const EdgeInsets.all(30),
              layout: ResponsiveBreakpoints.of(context).isDesktop
                  ? ResponsiveRowColumnType.ROW
                  : ResponsiveRowColumnType.COLUMN,
               children: [
              ResponsiveRowColumnItem(

                child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              -5.0, // Move to right 10  horizontally
                              -5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                        ],
                        border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.only(top: 40),
                    width: 300,
                    child: newPieChart.PieChart(
                      // Pass in the data for
                      // the pie chart
                      dataMap: dataMap,
                      // Set the colors for the
                      // pie chart segments
                      colorList: colorList,
                      // Set the radius of the pie chart
                      chartRadius: MediaQuery.of(context).size.width / 2,
                      // Set the center text of the pie chart
                      // Set the width of the
                      // ring around the pie chart
                      ringStrokeWidth: 24,
                      // Set the animation duration of the pie chart
                      animationDuration: const Duration(seconds: 3),
                      // Set the options for the chart values (e.g. show percentages, etc.)
                      chartValuesOptions: newPieChart.ChartValuesOptions(
                          showChartValues: true,
                          showChartValuesOutside: true,
                          showChartValuesInPercentage: true,
                          showChartValueBackground: false),
                      // Set the options for the legend of the pie chart
                      legendOptions: newPieChart.LegendOptions(
                          showLegends: true,
                          legendShape: BoxShape.rectangle,
                          legendTextStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          legendPosition: newPieChart.LegendPosition.bottom,
                          showLegendsInRow: true),
                      // Set the list of gradients for
                      // the background of the pie chart
                      gradientList: gradientList,
                    ),
                  ),
              ),
                ResponsiveRowColumnItem(

                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              -5.0, // Move to right 10  horizontally
                              -5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                        ],
                        border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.only(top: 40),
                    width: 300,
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          // The red line
                          LineChartBarData(
                            spots: dummyData1,
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.indigo,
                          ),
                          // The orange line
                          LineChartBarData(
                            spots: dummyData2,
                            isCurved: true,
                            barWidth: 3,
                            color: Colors.red,
                          ),
                          // The blue line
                          LineChartBarData(
                            spots: dummyData3,
                            isCurved: false,
                            barWidth: 3,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(

                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              -5.0, // Move to right 10  horizontally
                              -5.0, // Move to bottom 10 Vertically
                            ),
                          ),
                        ],
                        border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.only(top: 40),
                    width: 300,
                    child: BarChart(BarChartData(
                        borderData: FlBorderData(
                            border: const Border(
                          top: BorderSide.none,
                          right: BorderSide.none,
                          left: BorderSide(width: 1),
                          bottom: BorderSide(width: 1),
                        )),
                        groupsSpace: 10,
                        barGroups: [
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 15,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 11,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 7, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                          BarChartGroupData(x: 8, barRods: [
                            BarChartRodData(
                                fromY: 0,
                                toY: 10,
                                width: 15,
                                color: Colors.amber),
                          ]),
                        ])),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Recent messages",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        -5.0, // Move to right 10  horizontally
                        -5.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                  border: Border.all(color: Colors.white)),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Card(

                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            child: Align(alignment: Alignment.center,
                              child: Text(
                                messages[index]["user_name"],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  messages[index]["message"],
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          Container(
                            width: 150,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  messages[index]["status"],
                                  style: TextStyle(
                                      color: messages[index]["status"] ==
                                              "answered"
                                          ? Colors.blue
                                          : Colors.grey),
                                )),
                          ),
                          Container(
                            width: 150,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  messages[index]["time"],
                                  style: TextStyle(color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
