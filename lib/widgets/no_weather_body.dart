import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'No weather to start 😔',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                     color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
