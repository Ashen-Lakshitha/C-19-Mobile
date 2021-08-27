import 'dart:convert';
import 'package:covid_app/widget/boxContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoxWidget extends StatefulWidget {
  int state = 0;
  BoxWidget(this.state);

  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {

  Future<List<dynamic>> fetchUsers() async {
    var result = await http
        .get(Uri.https("www.hpb.health.gov.lk", "api/get-current-statistical"));
    var jsonData = jsonDecode(result.body);

    List<dynamic> list = [];
    Map<String, dynamic> data = jsonData['data'];


    if (widget.state == 0) {
      list.add(data['local_new_cases']);
      list.add(data['local_total_cases']);
      list.add(data['local_active_cases']);
      list.add(data['local_recovered']);
      list.add(data['local_new_deaths']);
      list.add(data['local_deaths']);
      list.add(data['update_date_time']);
    } else if (widget.state == 1) {
      list.add(data['global_new_cases']);
      list.add(data['global_total_cases']);
      list.add(data['global_total_cases'] -
          data['global_recovered'] -
          data['global_deaths']);
      list.add(data['global_recovered']);
      list.add(data['global_new_deaths']);
      list.add(data['global_deaths']);
      list.add(data['update_date_time']);
    }


    print(list);
    return list;
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder<List<dynamic>>(
              future: fetchUsers(),
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.data != null) {
                  return BoxContainer(snapshot.data);
                } else {
                  return Center(
                      heightFactor: 10,
                      child: CupertinoActivityIndicator(
                        radius: 20,
                      ));
                }
              })
          // TextButton(onPressed: fetchUsers, child: Text("click"))
        ],
      ),
    );
  }
}
