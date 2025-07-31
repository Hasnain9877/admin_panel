import 'package:flutter/material.dart';

class ShiftTabBarScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shifts = [
    {
      'title': 'Morning Shift - Al Barsha Zone',
      'time': '5:00 AM - 10:00 AM',
      'date': 'Today',
      'status': 'Active',
      'supervisor': 'Ahmed E.',
      'drivers': 12,
      'label': 'Active',
      'labelColor': Colors.green,
    },
    {
      'title': 'Evening Shift - Dubai Marina',
      'time': '5:00 PM - 11:00 PM',
      'date': 'Today',
      'status': 'Active',
      'supervisor': 'Sana M.',
      'drivers': 6,
      'label': 'Active',
      'labelColor': Colors.green,
    },
    {
      'title': 'Night Shift - Business Bay',
      'time': '11:00 PM - 4:00 AM',
      'date': 'Today',
      'status': 'Active',
      'supervisor': 'John S.',
      'drivers': 10,
      'label': 'Active',
      'labelColor': Colors.green,
    },
  ];

  ShiftTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Shifts', style: TextStyle(color: Colors.black)),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                side: const BorderSide(color: Colors.deepPurple),
              ),
              child: const Text(
                "Quick Actions",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            // TextButton(
            //   onPressed: null,
            //   child: Text(
            //     "Quick Actions",
            //     style: TextStyle(color: Colors.deepPurple),
            //   ),
            // ),
            CircleAvatar(child: Text("A")),
            SizedBox(width: 16),
          ],
          bottom: TabBar(
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.deepPurple,
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ShiftMessage(message: 'Wait for upcoming shifts.'),
            ShiftList(shifts: shifts, filter: 'Active'),
            const ShiftMessage(message: 'Wait for completed shifts.'),
          ],
        ),
      ),
    );
  }
}

class ShiftList extends StatelessWidget {
  final List<Map<String, dynamic>> shifts;
  final String filter;

  const ShiftList({super.key, required this.shifts, required this.filter});

  @override
  Widget build(BuildContext context) {
    final filteredShifts = shifts
        .where((shift) => shift['status'] == filter)
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: filteredShifts.map((shift) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shift['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: shift['labelColor'].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          shift['label'],
                          style: TextStyle(color: shift['labelColor']),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('${shift['time']} • ${shift['date']}'),
                  Text('Supervisor: ${shift['supervisor']}'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 20),
                      const SizedBox(width: 4),
                      Text('${shift['drivers']} Drivers Assigned'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text("View Drivers"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("Start Shift"),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text("View Route"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ShiftMessage extends StatelessWidget {
  final String message;
  const ShiftMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
