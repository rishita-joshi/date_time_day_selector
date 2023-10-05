import 'package:flutter/material.dart';

class DaySelectorWidget extends StatefulWidget {
   DaySelectorWidget({ Key? key ,required this.labelText,required this.isDaySelected,required this.dayColorChanged}) : super(key: key);
  String labelText;
  bool isDaySelected;
  final ValueChanged<bool> dayColorChanged;

  @override
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelectorWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Material(
          child: InkWell(
            onTap: () {
            setState(() {
             widget.dayColorChanged(widget.isDaySelected=!widget.isDaySelected);
              
            });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.08,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isDaySelected ? Colors.blue : Colors.grey),
              child: Center(child: Text(widget.labelText)),
            ),
          ),
        ),
    );

    
  }
}