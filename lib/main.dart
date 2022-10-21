import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DateTimePickerPage(),
    );
  }
}

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({super.key});

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPage();
}

class _DateTimePickerPage extends State<DateTimePickerPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  String get getData {
    return DateFormat("dd-MMM-yyyy").format(_selectedDate);
    //return DateFormat("MM-dd-yyyy").format(_selectedDate);
    //return DateFormat("dd-MM-yyyy").format(_selectedDate);
  }

  String get getTime {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, _selectedTime.hour, _selectedTime.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date & Time Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => openDataPicker(),
                  child: const Text('Select Date'),
                ),
                const SizedBox(width: 20),
                Text('Selected Date - $getData'),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => openTimePicker(),
                  child: const Text('Select Time'),
                ),
                const SizedBox(width: 20),
                Text('Selected Time - $getTime'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openDataPicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2005, 4, 1),
      lastDate: DateTime(2050),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  Future<void> openTimePicker() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }
}
