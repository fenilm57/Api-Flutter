import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Center(
          child: Text('Creator\'s Page'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('images/vibrant.gif'),
            height: 250,
          ),
          SizedBox(
            height: 45,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'By :',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    // backgroundColor: Colors.blue,
                  ),
                ),
                Text(
                  'Fenil Mehta'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    // backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
