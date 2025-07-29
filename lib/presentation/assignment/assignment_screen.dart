import 'package:flutter/material.dart';

import '../../common_widgets/app_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../constants/app_colors.dart';
import '../widgets/driver_card.dart';
import '../widgets/tab_bar_widget.dart';

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
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.kPrimaryColor,
                controller: _tabController,
                labelColor: AppColors.kPrimaryColor,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Manual Tasks'),
                  Tab(text: 'Auto Assignments'),
                ],
              ),

              CustomTextFormField(
                hintText: 'Search Drivers',
                prefixIcon: Icons.search,

                onChanged: (value) {
                  // Handle search logic here
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    DriverList(),
                    Center(child: Text("Auto Assignment Placeholder")),
                  ],
                ),
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),

                  onPressed: (){}, child: Text('Select Filter', style: TextStyle(color: Colors.white),)),
              const SizedBox(height: 30),
            ],
          ),
        ),
        if (MediaQuery.of(context).size.width > 800)
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