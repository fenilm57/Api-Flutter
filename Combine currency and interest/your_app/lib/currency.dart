import 'package:flutter/material.dart';
import 'package:flutter_currency_converter/Currency.dart';
import 'package:flutter_currency_converter/flutter_currency_converter.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  int amount;
  String dropdownValue;
  String currency;
  String result;
  final choosenCurrency = TextEditingController();

  void getAmounts(String value) async {
    if (value == 'Pounds') {
      value = "GBP";
    }
    double cadToInr = await FlutterCurrencyConverter.convert(
      Currency(value, amount: double.parse(choosenCurrency.text)),
      Currency(Currency.INR),
    );
    currency = value;

    print("cadToInr $cadToInr");
    String result1 = cadToInr.toStringAsFixed(2);
    result = result1;
    print(cadToInr.toStringAsFixed(2));
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
                  image: AssetImage('images/currency.jpg'),
                ),
                SizedBox(
                  height: 45,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  hint: Text('Currency'),
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 34,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['CAD', 'USD', 'EUR', 'Pounds', 'THB']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: choosenCurrency,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    setState(() {
                      getAmounts(dropdownValue);
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    'Calculate Currency',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  height: 50,
                ),
                (currency == "GBP")
                    ? Text(
                        '${choosenCurrency.text} Pound In INR is $result',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        '${choosenCurrency.text} $currency In INR is $result',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
