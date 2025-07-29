import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_textfield.dart';
import '../../constants/app_colors.dart';
import '../widgets/driver_card.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width > 800;

    return Row(
      children: [
        // 👈 Left Panel
        Expanded(
          flex: 2,
          child: Column(
            children: [
              // Top Tab Bar
              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.kPrimaryColor,
                labelColor: AppColors.kPrimaryColor,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Manual Tasks'),
                  Tab(text: 'Auto Assignments'),
                ],
              ),

              // Search + Content Scrollable Area
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          // Search Field
                          CustomTextFormField(
                            hintText: 'Search Drivers',
                            prefixIcon: Icons.search,
                            onChanged: (value) {},
                          ),

                          const SizedBox(height: 12),

                          // Tab Content
                          SizedBox(
                            height: 400, // 👈 required to prevent unbounded height
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                DriverList(),
                                Center(child: Text("Auto Assignment Placeholder")),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Filter Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Select Filter',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Drivers'),
                              Text('Available'),
                              Text('Pending Tasks')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 👈 Right Panel (Map)
        if (isWide)
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(8),
              color: Colors.grey[300],
              child: const Center(child: Text('Map View Placeholder')),
            ),
          ),
      ],
    );
  }
}

class DriverList extends StatelessWidget {
  const DriverList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (_, i) => const DriverCard(),
      separatorBuilder: (_, __) => const Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }
}
