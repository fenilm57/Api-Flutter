import 'package:flutter/material.dart';

const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class InterestFinder extends StatefulWidget {
  @override
  _InterestFinderState createState() => _InterestFinderState();
}

class _InterestFinderState extends State<InterestFinder> {
  String rate = '';
  String amount = '';
  double answer;
  String ans;
  String text;
  double year;
  final rateController = TextEditingController();
  final amountController = TextEditingController();
  void calculateInterest() {
    setState(() {
      double rate1 = double.parse(rateController.text) / 100;
      double month = rate1 / 12;
      answer = month * double.parse(amountController.text);
      year = answer * 12;
      text = answer.toStringAsFixed(2);
      ans = year.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/bank.jpg'),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: kTextStyle,
                    controller: rateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      hintText: 'Enter Interest Rate',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: amountController,
                    style: kTextStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      hintText: 'Enter Total Amount',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    calculateInterest();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    'Calculate Amount',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Interest Per Month is $text',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Interest Per Year is $ans',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
