import 'package:your_app/rental_yield.dart';

import 'currency.dart';
import 'package:flutter/material.dart';
import './interest.dart';
import 'currency_to_inr.dart';
import 'info_page.dart';

int counter = 0;
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "Interest Calculator";

  void changeScreen() {
    // Counter for changing screen
    counter++;
    if (counter > 3) {
      counter = 0;
    }
    if (counter == 0) {
      title = 'Interest Calculator';
      print(counter);
    } else if (counter == 1) {
      title = "Currency Converter";
      print(counter);
    } else if (counter == 2) {
      title = "CAD Converter";
    } else {
      title = "Rental Yield";
      print(counter);
    }
  }

  Widget display(int counter) {
    if (counter == 0) {
      return InterestFinder();
    } else if (counter == 1) {
      return CurrencyConverter();
    } else if (counter == 2) {
      return CADToINR();
    } else {
      return RentalYield();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: Title(
          color: Colors.white,
          child: Text(title),
        ),
        leading: FlatButton(
          child: Icon(
            Icons.info,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoPage()),
            );
          },
        ),
        centerTitle: true,
        actions: [
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  changeScreen();
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: display(counter),
    );
  }
}
