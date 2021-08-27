import 'dart:convert';
import 'package:covid_app/widget/boxContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  String dropdownValue = 'Sri Lanka';

  Future<List<dynamic>> fetchCountries() async {
    List<String> _countries = [];
    var result = await http.get(Uri.https("api.covid19api.com", "summary"));
    var jsonData = jsonDecode(result.body);

    dynamic data = jsonData['Countries'];

    for (var ln in data) _countries.add(ln['Country']);
    _countries.sort();
    dropdownValue = _countries[0];
    // print(_countries.toString());
    return _countries;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: fetchCountries(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.data != null) {
            return CountrySitu(snapshot.data,dropdownValue,);
          } else {
            return Center(
                heightFactor: 10,
                child: CupertinoActivityIndicator(
                  radius: 20,
                ));
          }
        });
  }
}

class CountrySitu extends StatefulWidget {
  dynamic countries;
  String dropdownValue;
  CountrySitu(this.countries, this.dropdownValue);

  @override
  _CountrySituState createState() => _CountrySituState(countries, dropdownValue);
}

class _CountrySituState extends State<CountrySitu> {

  dynamic countries;
  String dropdownValue;
  _CountrySituState(this.countries, this.dropdownValue);

  Future<List<dynamic>> fetchCountries() async {
    List<dynamic> list = [];
    var result = await http.get(Uri.https("api.covid19api.com", "summary"));
    var jsonData = jsonDecode(result.body);

    List<dynamic> data = jsonData['Countries'];
    // print(data[0].toString());

    for (int i=0; i<countries.length; i++) {
      if(data[i]['Country'].compareTo(dropdownValue) == 0) {
        print(data[i].toString());
        list.add(data[i]['NewConfirmed']);
        list.add(data[i]['TotalConfirmed']);
        list.add(data[i]['TotalConfirmed'] - data[i]['TotalRecovered'] - data[i]['TotalDeaths']);
        list.add(data[i]['TotalRecovered']);
        list.add(data[i]['NewDeaths']);
        list.add(data[i]['TotalDeaths']);
        break;
      }
    }
    // print("co " + data.toString());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.645,
          // color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.045,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xFFE5E5E5))),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.location_on_sharp,size: MediaQuery.of(context).size.height * 0.032),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Expanded(
                        child: DropdownButton(
                          elevation: 20,
                          iconSize: MediaQuery.of(context).size.height * 0.04,
                          isExpanded: true,
                          // underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down),
                          value: dropdownValue,
                          items: widget.countries.map<DropdownMenuItem<String>>((dynamic item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.w400
                              ),),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
            ),
          ),
              ),
              FutureBuilder<List<dynamic>>(
                future: fetchCountries(),
                builder: (context, snapshot) {
                  // print(snapshot.data.toString());
                  if (snapshot.data != null) {
                    return BoxContainer(snapshot.data);
                  } else {
                    return Center(
                      heightFactor: 10,
                      child: CupertinoActivityIndicator(
                        radius: 20,
                      )
                    );
                  }
                }
              )
        ])),
      ),
    );
  }
}

