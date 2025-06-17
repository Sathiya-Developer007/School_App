import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/period_model.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  DateTime _selectedDate = DateTime(2019, 8);
  int _selectedDayIndex = 1; // 👈 You must have this inside this class
  int _selectedPeriodIndex = -1; 


  late Future<List<Period>> _periodsFuture;

  @override
  void initState() {
    super.initState();
    _periodsFuture = fetchPeriods();
  }

  Future<List<Period>> fetchPeriods() async {
    const String apiUrl = 'http://schoolmanagement.canadacentral.cloudapp.azure.com:5000/api/master/periods';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Period.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load periods');
    }
  }

  String get _formattedMonthYear {
    return "${_monthNames[_selectedDate.month - 1]}. ${_selectedDate.year}";
  }

  final List<String> _monthNames = const [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  void _goToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _goToPreviousMonth,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_back_ios, size: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  _formattedMonthYear,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _goToNextMonth,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 26,
                    color: Color.fromARGB(255, 211, 221, 225),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                final days = ["Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat.", "Sun."];
                final dates = ["15", "16", "17", "18", "19", "20", "21"];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                  child: _DayTab(
                    day: days[index],
                    date: dates[index],
                    selected: _selectedDayIndex == index,
                  ),
                );
              }),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Tap a row to view the timetable",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4D4D4D),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/Pencil.svg',
                              height: 16,
                              width: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const Divider(thickness: 0.5, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FutureBuilder<List<Period>>(
                  future: _periodsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error loading periods: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No periods available');
                    }

                    final periods = snapshot.data!;
                 return Column(
  children: List.generate(periods.length, (index) {
    final period = periods[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriodIndex = index;
        });
      },
      child: _TimeSlot(
        time: period.timeRange,
        classInfo: period.name,
        isBlue: _selectedPeriodIndex == index, // selected = blue
      ),
    );
  }),
);
    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayTab extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;
  const _DayTab({
    required this.day,
    required this.date,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF29ABE2) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day, style: const TextStyle(fontSize: 12)),
            Text(date, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _TimeSlot extends StatelessWidget {
  final String time;
  final String classInfo;
  final bool isBlue;

  const _TimeSlot({
    required this.time,
    required this.classInfo,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isBlue ? const Color(0xFF29ABE2) : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 11.0),
            child: Text(
              classInfo,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
          ),
          const Divider(thickness: 0.8, color: Colors.grey),
        ],
      ),
    );
  }
}
