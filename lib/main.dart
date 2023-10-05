import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';
import 'day_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DaySelector());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<TimeOfDay?> selectedTime;
  var list = [];
  final List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek("Tue"),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
    DayInWeek(
      "Sat",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              selectedTime = showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return Container(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectWeekDays(
                            fontSize: 12,
                            // unSelectedDayTextColor: Color(0xFF01579B) ,
                            selectedDayTextColor: Color(0xFF01579B),
                            //backgroundColor: Color(0xFF01579B),
                            fontWeight: FontWeight.w500,
                            days: _days,
                            border: false,
                            padding: 0,
                            onSelect: (values) {
                              print(values);
                              var matchvalues = values.toString();
                              if (matchvalues.contains('Sun')) {
                                list.insert(0, 1);
                              } else {
                                list.insert(0, 0);
                              }
                              if (matchvalues.contains('Mon')) {
                                list.insert(1, 1);
                              } else {
                                list.insert(0, 1);
                              }

                              print(list);
                            },
                          ),
                          child!
                        ],
                      ),
                    );
                  });
            },
            child: const Center(child: Text("data"))),
      ),
    );
  }
}

class MyList {
  late String dayName;
  late int value;
  MyList({
    required this.dayName,
    required this.value,
  });
}
