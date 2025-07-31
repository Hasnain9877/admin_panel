import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  const Sidebar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.assignment,
      Icons.table_chart,
      Icons.people,
      Icons.group,
      Icons.gps_fixed,
      Icons.chat,
      Icons.access_time,
      Icons.settings,
    ];
    final labels = [
      'Assignments',
      'Table View',
      'Drivers',
      'Teams',
      'Live Tracking',
      'Chats',
      'Shifts',
      'Settings',
    ];

    return Container(
      width: 200,
      color: Colors.grey[100],
      child: Column(
        children: [
          const SizedBox(height: 40),
          for (int i = 0; i < labels.length; i++)
            ListTile(
              leading: Icon(
                items[i],
                color: selectedIndex == i ? Colors.blue : Colors.black,
              ),
              title: Text(labels[i]),
              selected: selectedIndex == i,
              selectedTileColor: Colors.blue.shade100,
              onTap: () => onItemSelected(i),
            ),
          const Spacer(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Light'), SizedBox(width: 8), Text('Dark')],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
