import 'package:admin_panel/common_widgets/side_bar.dart';
import 'package:admin_panel/common_widgets/top_bar.dart';
import 'package:admin_panel/presentation/Screens/driver.dart';
import 'package:admin_panel/presentation/Screens/shift.dart';
import 'package:flutter/material.dart';

import '../presentation/assignment/assignment_screen.dart';

class ResponsiveScaffold extends StatefulWidget {
  const ResponsiveScaffold({super.key});

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  int selectedIndex = 0;

  final List<String> pages = [
    'Assignments',
    'Table View',
    'Drivers',
    'Teams',
    'Live Tracking',
    'Chats',
    'Shifts',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      drawer: isDesktop
          ? null
          : Drawer(
              child: Sidebar(
                onItemSelected: _onItemSelected,
                selectedIndex: selectedIndex,
              ),
            ),
      body: Row(
        children: [
          if (isDesktop)
            Sidebar(
              onItemSelected: _onItemSelected,
              selectedIndex: selectedIndex,
            ),
          Expanded(
            child: Column(
              children: [
                TopBar(title: pages[selectedIndex]),
                Expanded(child: getScreenContent(pages[selectedIndex])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (MediaQuery.of(context).size.width < 800) Navigator.pop(context);
  }

  Widget getScreenContent(String title) {
    if (title == 'Assignments') return AssignmentScreen();
    if (title == 'Drivers') return DriverDashboard();
    if (title == 'Shifts') return ShiftTabBarScreen();
    return Center(
      child: Text('$title Page', style: const TextStyle(fontSize: 24)),
    );
  }
}
