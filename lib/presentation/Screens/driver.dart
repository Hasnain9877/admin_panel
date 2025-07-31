import 'package:admin_panel/presentation/Screens/adddriver.dart';
import 'package:flutter/material.dart';

class DriverDashboard extends StatelessWidget {
  const DriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Row(
        children: [
          // Sidebar Filters
          Container(
            width: 240,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text('Driver Status'),
                const SizedBox(height: 8),
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: const Text('Online'),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: (_) {},
                  title: const Text('Offline'),
                ),
                const Divider(),
                const Text('Availability'),
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  title: const Text('Available'),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: (_) {},
                  title: const Text('Busy'),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: (_) {},
                  title: const Text('On Break'),
                ),
                const Divider(),
                const Text('Team'),
                DropdownButton<String>(
                  value: 'All Teams',
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: 'All Teams',
                      child: Text('All Teams'),
                    ),
                    DropdownMenuItem(value: 'North', child: Text('North')),
                  ],
                  onChanged: null,
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'All Drivers (248 total)',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Summary Cards
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      summaryCard(Icons.people, 'Total Drivers', '124'),
                      summaryCard(
                        Icons.radio_button_checked,
                        'Active Now',
                        '87',
                      ),
                      summaryCard(Icons.assignment, 'On Task', '45'),
                      summaryCard(Icons.alt_route, 'Total Distance', '1234 km'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Add Driver Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sort by: Name'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddDriverApp(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // نیلا رنگ
                        ),
                        child: const Text('Add Driver'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Driver Cards Grid
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: drivers
                        .map((driver) => driverCard(driver))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget summaryCard(IconData icon, String label, String value) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(label, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget driverCard(Map<String, dynamic> driver) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(driver['image']),
                radius: 24,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    driver['status'],
                    style: TextStyle(
                      color: driver['status'] == 'Online'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          const Divider(),
          Text('Tasks Today: ${driver['tasks']}'),
          Text('Distance (km): ${driver['distance']}'),
          Text('Team: ${driver['team']}'),
          Text('Status: ${driver['availability']}'),
          const SizedBox(height: 8),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('Track')),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () {}, child: const Text('Message')),
            ],
          ),
        ],
      ),
    );
  }
}

// Sample Driver Data
List<Map<String, dynamic>> drivers = [
  {
    'name': 'Alex Thompson',
    'status': 'Offline',
    'availability': 'Movable',
    'tasks': 12,
    'distance': 85.2,
    'team': 'North Zone',
    'image': 'https://i.pravatar.cc/150?img=3',
  },
  {
    'name': 'Sarah Wilson',
    'status': 'Online',
    'availability': 'Busy',
    'tasks': 8,
    'distance': 62.5,
    'team': 'South Zone',
    'image': 'https://i.pravatar.cc/150?img=4',
  },
  {
    'name': 'Emily Davis',
    'status': 'Online',
    'availability': 'Available',
    'tasks': 10,
    'distance': 78.3,
    'team': 'West Zone',
    'image': 'https://i.pravatar.cc/150?img=5',
  },
];
