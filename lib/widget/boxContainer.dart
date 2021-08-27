// import 'dart:html';

import 'package:covid_app/widget/lineChart.dart';
import 'package:flutter/material.dart';

class BoxContainer extends StatefulWidget {
  List<dynamic> list;
  BoxContainer(this.list);

  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            box(widget.list[0].toString(), 'New Cases',
                Colors.greenAccent, Colors.green),
            box(widget.list[1].toString(), 'Total Cases',
                Colors.greenAccent, Colors.green),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            box(widget.list[2].toString(), 'Active Cases',
                Colors.deepPurpleAccent, Colors.deepPurple),
            box(widget.list[3].toString(), 'Total Recovered',
                Colors.deepPurpleAccent, Colors.deepPurple),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            box(widget.list[4].toString(), 'New Deaths',
                Colors.redAccent, Colors.red),
            box(widget.list[5].toString(), 'Total Deaths',
                Colors.redAccent, Colors.red),
          ],
        ),
      ],
    );
  }

  Widget box(String count, String title, Color color1, Color color2) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(3.0),
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.all(6.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.025,
                      width: MediaQuery.of(context).size.height * 0.025,
                      decoration: BoxDecoration(
                        color: color1.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.007),
                        decoration: BoxDecoration(
                            color: color2.withOpacity(0.8),
                            shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(children: [
                    Column(children: [
                      Text(
                        count,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'People',
                        style: TextStyle(fontSize: 10),
                      ),
                    ]),
                    Expanded(child: LineChartReport()),
                  ]),
                ),
              ])),
    );
  }
}
