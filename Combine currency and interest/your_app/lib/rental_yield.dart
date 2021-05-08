import 'package:flutter/material.dart';

const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
double ans;
int rent;
int property;

class RentalYield extends StatefulWidget {
  @override
  _RentalYieldState createState() => _RentalYieldState();
}

class _RentalYieldState extends State<RentalYield> {
  final rentController = TextEditingController();
  String answer;

  final propertyController = TextEditingController();

  void rentalYield() {
    rent = (int.parse(rentController.text)) * 12;
    print(rent);
    property = int.parse(propertyController.text);
    print(property);
    ans = ((rent / property) * 100);
    setState(() {
      answer = ans.toStringAsFixed(2);
    });
    print(ans);
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
                  image: AssetImage('images/rental.png'),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: kTextStyle,
                    controller: rentController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      hintText: 'Enter Monthly Rent',
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
                    controller: propertyController,
                    style: kTextStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      hintText: 'Enter Property Value',
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
                    rentalYield();
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
                  height: 40,
                ),
                Text(
                  'Property Yield is $answer',
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
