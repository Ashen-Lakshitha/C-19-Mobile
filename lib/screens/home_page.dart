import 'package:covid_app/screens/global.dart';
import 'package:covid_app/screens/home.dart';
import 'package:covid_app/screens/stat.dart';
import 'package:covid_app/widget/bottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  List<Widget> _screens = [Home(), StatData(), Global()];
}

class _HomePageState extends State<HomePage> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60.withOpacity(0.97),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: MediaQuery.of(context).size.height * 0.041),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                    ),
                    // color: Colors.lightBlueAccent,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Covid - 19',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // SizedBox(height: 5),
                        Text(
                          'Are you feeling sick?',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(height: 5,),
                        Text(
                          'If you feel sick with any COVID-19 symptoms, please call 1999 or text us immediately for help',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        // SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            btn(Icons.phone, Colors.red, 'Call Now',
                                _launchCall),
                            btn(Icons.message, Colors.blue, 'Send SMS',
                                _launchMsg),
                          ],
                        ),
                      ])),
            ),
            widget._screens.elementAt(_currentScreen),
          ]),
      bottomNavigationBar: BottomNav(
        selectedIndex: _currentScreen,
        onSelect: (int screen) {
          setState(() {
            _currentScreen = screen;
          });
        },
      ),
    );
  }
}

void _launchCall() async {
  const uri = 'tel:1999';
  if (await canLaunch(uri)) {
    launch(uri);
  }
}

void _launchMsg() async {
  const uri = 'sms:1999';
  if (await canLaunch(uri)) {
    launch(uri);
  }
}

Widget btn(IconData icon, Color color, String text, Function func) {
  return FlatButton.icon(
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    onPressed: func,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    icon: Icon(
      icon,
      color: Colors.white,
    ),
    label: Text(
      text,
    ),
    textColor: Colors.white,
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height*0.92);
    var firstControlPoint = new Offset(size.width*0.25, size.height*1.05);
    var firstEndPoint = new Offset(size.width*0.5, size.height*0.92);
    var secondControlPoint = new Offset(size.width*0.75, size.height*0.79);
    var secondEndPoint = new Offset(size.width, size.height*0.92);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper)
  {
    return false;
  }
}