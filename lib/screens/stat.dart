import 'package:covid_app/widget/boxWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatData extends StatefulWidget {
  @override
  _StatDataState createState() => _StatDataState();
}

class _StatDataState extends State<StatData> {
  int segmentedControlValue = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*0.645,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height*0.045,
                child: CupertinoSlidingSegmentedControl(
                  groupValue: segmentedControlValue,
                  backgroundColor: Colors.lightBlueAccent.withOpacity(0.5),
                  children: const <int, Widget>{
                    0: Text('Local',style: TextStyle(fontSize: 18),),
                    1: Text('Global',style: TextStyle(fontSize: 18),),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      segmentedControlValue = value;
                    });
                  }
                ),
              ),
              BoxWidget(segmentedControlValue)
            ],
          ),
        ),
      ),
    );
  }
}
