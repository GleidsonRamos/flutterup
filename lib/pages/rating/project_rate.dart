import 'package:flutter/material.dart';
import 'package:flutter_up/components/textbox.dart';

import '../home.dart';

class DriverRate extends StatefulWidget {
  @override
  _DriverRateState createState() => _DriverRateState();
}

class _DriverRateState extends State<DriverRate> {
  Widget emptyStar = Icon(
    Icons.star_border,
    size: 40.0,
  );

  Widget fullStar = Icon(
    Icons.star,
    size: 40.0,
    color: Colors.yellow,
  );

  Widget _firstStar;
  Widget _secondStar;
  Widget _thirdStar;
  Widget _fourthStar;
  Widget _fifthStar;

  @override
  void initState() {
    _firstStar = emptyStar;
    _secondStar = emptyStar;
    _thirdStar = emptyStar;
    _fourthStar = emptyStar;
    _fifthStar = emptyStar;
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController _descriptionController;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Rate the project",
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: _firstStar,
                      onTap: () {
                        _firstStarPressed();
                      },
                    ),
                    GestureDetector(
                      child: _secondStar,
                      onTap: () {
                        _secondStarPressed();
                      },
                    ),
                    GestureDetector(
                      child: _thirdStar,
                      onTap: () {
                        _thirdStarPressed();
                      },
                    ),
                    GestureDetector(
                      child: _fourthStar,
                      onTap: () {
                        _fourthStarPressed();
                      },
                    ),
                    GestureDetector(
                      child: _fifthStar,
                      onTap: () {
                        _fifthStarPressed();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Textbox(
                    label: "Description",
                    controller: _descriptionController,
                    callback: (){},
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      width: 250,
                      height: 60,
                      //Same height of Tween end
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Text(
                        "Rate",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _firstStarPressed() {
    setState(() {
      _firstStar = fullStar;
      _secondStar = emptyStar;
      _thirdStar = emptyStar;
      _fourthStar = emptyStar;
      _fifthStar = emptyStar;
    });
  }

  _secondStarPressed() {
    setState(() {
      _firstStar = fullStar;
      _secondStar = fullStar;
      _thirdStar = emptyStar;
      _fourthStar = emptyStar;
      _fifthStar = emptyStar;
    });
  }

  _thirdStarPressed() {
    setState(() {
      _firstStar = fullStar;
      _secondStar = fullStar;
      _thirdStar = fullStar;
      _fourthStar = emptyStar;
      _fifthStar = emptyStar;
    });
  }

  _fourthStarPressed() {
    setState(() {
      _firstStar = fullStar;
      _secondStar = fullStar;
      _thirdStar = fullStar;
      _fourthStar = fullStar;
      _fifthStar = emptyStar;
    });
  }

  _fifthStarPressed() {
    setState(() {
      _firstStar = fullStar;
      _secondStar = fullStar;
      _thirdStar = fullStar;
      _fourthStar = fullStar;
      _fifthStar = fullStar;
    });
  }
}
