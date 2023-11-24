import 'dart:math';

import 'package:adminpannelweb/side_menubar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as newPieChart;
import 'dashboard_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isLeftTapped = true;
  List<Map<String, dynamic>> tasks = [
    {
      "name": "ClientOnboarding- Circle",
      "admin": "Arpan M.",
      "members": "3",
      "status": "In progress",
      "run_time": "6 hours",
      "finish_date": "1/11/2023"
    },
    {
      "name": "Meeting with Webflow & Notion",
      "admin": "Dilip D.",
      "members": "8",
      "status": "Done",
      "run_time": "9 hours",
      "finish_date": "11/10/2023"
    },
    {
      "name": "First Handoff with Engineers",
      "admin": "Sovon P.",
      "members": "25",
      "status": "In progress",
      "run_time": "7 hours",
      "finish_date": "14/11/2023"
    },
    {
      "name": "Client Drafting(2)",
      "admin": "Anil M.",
      "members": "2",
      "status": "In progress",
      "run_time": "18 hours",
      "finish_date": "21/11/2023"
    },
  ];
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
          "Tasks",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 600,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Search",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLeftTapped = !isLeftTapped;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                color: isLeftTapped == true
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Left",
                                    style: TextStyle(
                                        color: isLeftTapped == true
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLeftTapped = !isLeftTapped;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                color: isLeftTapped == false
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Right",
                                    style: TextStyle(
                                        color: isLeftTapped == false
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last tasks",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Row(
                              children: [
                                Text(
                                  "117 total,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  "proceed to resolve them",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "94",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Text(
                              "Done",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "23",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Text(
                              "In progress",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          child: Text(
                            "Name",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: Text(
                            "Admin",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: Text(
                            "Members",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: Text(
                            "Status",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: Text(
                            "Run time",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: Text(
                            "Finish date",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 300,
                                child: Text(
                                  tasks[index]["name"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Text(
                                  tasks[index]["admin"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Text(
                                  tasks[index]["members"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Text(
                                  tasks[index]["status"],
                                  style: TextStyle(
                                      color: tasks[index]["status"] == "Done"
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Text(
                                  tasks[index]["run_time"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: Text(
                                  tasks[index]["finish_date"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 250,

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
                  width: 500,
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
                Container(
                  height: 200,
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
                  width: 500,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
