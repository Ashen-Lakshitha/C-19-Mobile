import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          height: MediaQuery.of(context).size.height*0.645,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Symptoms',
                style: TextStyle(
                    fontSize: 23
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card("assets/svg/fever.png","Fever"),
                  Card("assets/svg/headache.png","Headache"),
                  Card("assets/svg/cough.png","Cough"),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.001),
              Text(
                'Preventions',
                style: TextStyle(
                    fontSize: 23
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card("assets/svg/face-mask.png","Use Mask"),
                  Card("assets/svg/washing-hands.png","Wash Hands"),
                  Card("assets/svg/social-distancing.png","Social Distance"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String image;
  final String title;
  Card(this.image,this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.22,
      width: MediaQuery.of(context).size.width*0.3,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            scale: MediaQuery.of(context).size.aspectRatio,
            fit: BoxFit.fitWidth,
          ),
          // SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
                fontSize:  MediaQuery.of(context).size.height*0.021,
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}