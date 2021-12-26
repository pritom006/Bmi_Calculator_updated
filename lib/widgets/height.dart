import 'package:flutter/material.dart';

class HeightExpanded extends StatefulWidget {
  double height;
  final Function heightF;
  HeightExpanded({Key? key, required this.height, required this.heightF})
      : super(key: key);

  @override
  _HeightExpandedState createState() => _HeightExpandedState();
}

class _HeightExpandedState extends State<HeightExpanded> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('HEIGHT', style: TextStyle(fontSize: 27)),
        RichText(
          text: TextSpan(
              text: widget.height.round().toString(),
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(text: 'cm', style: TextStyle(fontSize: 22))
              ]),
        ),
        SliderTheme(
            data: SliderThemeData(
                activeTrackColor: Color(0xFFF9116E),
                inactiveTrackColor: Colors.grey,
                overlayColor: Colors.white12,
                trackHeight: 4,
                thumbColor: Color(0xFFF4668E)),
            child: Slider(
              value: widget.height,
              onChanged: (double value) => widget.heightF(value),
              max: 350,
              min: 0,
              label: widget.height.round().toString(),
            ))
      ],
    );
  }
}
