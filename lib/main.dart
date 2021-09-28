import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(MaterialApp(
  home: MyDatePickerApp(),
));

class MyDatePickerApp extends StatefulWidget {
  @override
  _MyDatePickerAppState createState() => _MyDatePickerAppState();
}

class _MyDatePickerAppState extends State<MyDatePickerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(

                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText:'Selected Date'
                ),
              ),
            ),
            FlatButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(''),
                          content: Container(
                            height: 500,
                            width: 500,
                            child: Column(
                              children: [
                                getDateRangePicker(),
                                MaterialButton(
                                  child: Text('Ok'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }
                                )

                              ],
                            ),
                          ),
                        );
                      }
                  );
                },
                child: Text('Select Date', style: TextStyle(color: Colors.white),),
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }

  Widget getDateRangePicker() {
    return Container(
        height: 250,
        child: Card(
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: selectionChanged,
            )));
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    print('Selected Date range is : ${dateRangePickerSelectionChangedArgs.value}');
   /* _selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);

    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });*/
  }
}

/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(MyApp());
}

/// My app class to display the date range picker
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

/// State for MyApp
class MyAppState extends State<MyApp> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('DatePicker demo'),
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Selected date: ' + _selectedDate),
                      Text('Selected date count: ' + _dateCount),
                      Text('Selected range: ' + _range),
                      Text('Selected ranges count: ' + _rangeCount)
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 80,
                  right: 0,
                  bottom: 0,
                  child: SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  ),
                )
              ],
            )));
  }
}*/
