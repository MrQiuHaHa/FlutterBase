import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {

  DateTime _selectdDate = DateTime.now();

  TimeOfDay _selectdTime = TimeOfDay.now();

  Future<void> _selectedDateClick () async {
     final DateTime date = await showDatePicker (
      context: context, 
      initialDate: _selectdDate, 
      firstDate: DateTime(1990), 
      lastDate: DateTime(2100)
    );

    if (date == null) {
      return;
    }

    setState(() {
      _selectdDate = date;
    });

  }

  Future<void> _selectedTimeClick () async {
    final TimeOfDay time = await showTimePicker(context: context, initialTime: _selectdTime);
    if (time == null) {
      return;
    }

    setState(() {
      _selectdTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectedDateClick,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMd().format(_selectdDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                InkWell(
                  onTap: _selectedTimeClick,
                  child: Row(
                    children: <Widget>[
                      Text(_selectdTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}