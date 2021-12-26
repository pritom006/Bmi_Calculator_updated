import 'package:bmi_calculator/widgets/bmi_math.dart';
import 'package:flutter/material.dart';

class AgeWeight extends StatefulWidget {
  int intValue;
  final String textValue;
  final VoidCallback incrementFunc;
  final VoidCallback decrementFunc;
  AgeWeight(
      {Key? key,
      required this.textValue,
      required this.intValue,
      required this.incrementFunc,
      required this.decrementFunc})
      : super(key: key);

  @override
  _AgeWeightState createState() => _AgeWeightState();
}

class _AgeWeightState extends State<AgeWeight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.textValue,
          style: TextStyle(fontSize: 23),
        ),
        Text(
          widget.intValue.toString(),
          style: TextStyle(fontSize: 45),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white12,
              onPressed: widget.decrementFunc,
              child: Icon(
                Icons.remove,
                size: 50,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              backgroundColor: Colors.white12,
              onPressed: widget.incrementFunc,
              child: Icon(
                Icons.add,
                size: 50,
              ),
            )
          ],
        )
      ],
    );
  }
}
