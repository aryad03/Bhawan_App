import 'package:flutter/material.dart';


class LaundryBar extends StatelessWidget {
  const LaundryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ Container(
        // margin: EdgeInsets.fromLTRB(, , 5.0, 0.0),

        color: Colors.grey[400],
        child: Row(
            children: [
              SizedBox(height: 47.0,width: 30.0),
              Text(
                'Laundry System',
                style: TextStyle(
                  fontSize: 25.0,
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w500,
                ),
              ),]
        ),
      ),
      ],
    );
  }
}
