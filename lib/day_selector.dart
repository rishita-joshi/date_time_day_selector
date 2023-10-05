import 'package:day_picker_package/widget/custom_time_picker.dart';
import 'package:flutter/material.dart';

class DaySelector extends StatefulWidget {
  DaySelector({Key? key}) : super(key: key);

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  bool isSundaySelected = false;
  bool isMondaySelected = false;
  bool isTuesdaySelected = false;
  bool isWednesdaySelected = false;
  bool isThursDaySelected = false;
  bool isFriDaySelected = false;
  bool isSaturDaySelected = false;
  // dynamic selectedTime = "time and day";
  String day = "days";
  String time = "time";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _selectTime(context);
                    // final  picked_s = showTimePicker(
                    //     context: context, initialTime: TimeOfDay.now()) as TimeOfDay ;
                    //     print(picked_s);
                    // if (picked_s != null && picked_s != selectedTime)
                    //   setState(() {
                    //     selectedTime = picked_s ;
                    //   });
                    //   print(selectedTime);
                  },
                  child: Text("click me")),
              Text(day),
              Text(time),
              //   Text(selectedTime),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    var picked_s =
        await showDayTimePicker(context: context, initialTime: TimeOfDay.now());
    print("picked_s $picked_s");
    //picked_s.toString();

    Map<dynamic, dynamic> result = picked_s;
    Map<String, dynamic> data = Map<String, dynamic>();
    for (dynamic type in result.keys) {
      data[type.toString()] = result[type];
      print(data['day']);
      print(data['time']);
      // print("Data $data");
    }
    setState(() {
      day = data['day'].toString();
      time = data['time'].toString();
      //  selectedTime = picked_s;
    });

    // if (picked_s != null && picked_s != selectedTime)
  }
}
