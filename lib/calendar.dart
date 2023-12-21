import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("CALENDAR", style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  "December 2023",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        _buildTableCell("Sun"),
                        _buildTableCell("Mon"),
                        _buildTableCell("Tue"),
                        _buildTableCell("Wed"),
                        _buildTableCell("Thu"),
                        _buildTableCell("Fri"),
                        _buildTableCell("Sat"),
                      ],
                    ),
                    TableRow(
                      children: List.generate(
                        7,
                        (index) => _buildTableCell((index + 1).toString()),
                      ),
                    ),
                    // Add more rows as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(String day) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(day),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Calendar(),
  ));
}
