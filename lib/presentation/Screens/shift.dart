import 'package:admin_panel/common_widgets/app_button.dart';
import 'package:flutter/material.dart';

class ShiftStatsScreen extends StatelessWidget {
  const ShiftStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // 🔍 Search + Create Shift Button Row (TOP)
            // 🔍 Search + Create Shift Button Row (TOP)
            // 🔍 Search + Create Shift Button Row (TOP)
            // 🔍 Search + Create Shift Button Row (TOP)
            // 🔍 Search + Create Shift Button Row (TOP)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LEFT SIDE → Search + Create Shift
                  Row(
                    children: [
                      SizedBox(
                        height: 48,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Shift",
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.deepPurple,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 12,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 48,
                        width: 200,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.black),
                          label: const Text(
                            "Create Shift",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // RIGHT SIDE → Auto Assign + Import CSV
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quick Action button (top)
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Quick Action",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Auto Assign + Import CSV (same row)
                      Row(
                        children: [
                          SizedBox(
                            height: 48,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.auto_fix_high,
                                color: Colors.black,
                              ),
                              label: const Text(
                                "Auto Assign",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 48,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.file_upload,
                                color: Colors.black,
                              ),
                              label: const Text(
                                "Import CSV",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ), // 📌 TabBar
            const TabBar(
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepPurple,
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ],
            ),

            // 📌 TabBar Content
            Expanded(
              child: TabBarView(
                children: [
                  const Center(child: Text("Upcoming Shifts")),
                  buildActiveTab(),
                  const Center(child: Text("Completed Shifts")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildActiveTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildShiftCard(
          title: "Morning Shift - Al Barsha Zone",
          time: "5:00 AM - 10:00 AM",
          date: "Today",
          status: "Active",
          statusColor: Colors.green,
          driver: "John Doe",
          supervisor: "Alex Smith",
        ),
        buildShiftCard(
          title: "Evening Shift - Dubai Marina",
          time: "5:00 PM - 10:00 PM",
          date: "Today",
          status: "Upcoming",
          statusColor: Colors.orange,
          driver: "David Mark",
          supervisor: "Sarah Lee",
        ),
        buildShiftCard(
          title: "Night Shift - Business Bay",
          time: "10:00 PM - 3:00 AM",
          date: "Today",
          status: "Completed",
          statusColor: Colors.red,
          driver: "Michael Jordan",
          supervisor: "Laura White",
        ),
      ],
    );
  }

  static Widget buildShiftCard({
    required String title,
    required String time,
    required String date,
    required String status,
    required Color statusColor,
    required String driver,
    required String supervisor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: statusColor, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Time & Date Row
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Driver & Supervisor Row
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.deepPurple),
                const SizedBox(width: 4),
                Text("Driver: $driver", style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 16),
                const Icon(
                  Icons.supervisor_account,
                  size: 18,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 4),
                Text(
                  "Supervisor: $supervisor",
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Buttons Row
            LayoutBuilder(
              builder: (context, constraints) {
                const gap = 8.0;
                final availableWidth = constraints.maxWidth;
                final buttonWidth = (availableWidth - gap * 2) / 3;

                return Row(
                  children: [
                    SizedBox(
                      width: buttonWidth,
                      child: AppAsyncLoadingButton(
                        title: "View Drivers",
                        icon: Icons.people,
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                        borderRadius: 8,
                        size: ButtonSize.small,
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 1));
                        },
                      ),
                    ),
                    const SizedBox(width: gap),
                    SizedBox(
                      width: buttonWidth,
                      child: AppAsyncLoadingButton(
                        title: "Start Shift",
                        icon: Icons.play_arrow,
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        borderRadius: 8,
                        size: ButtonSize.small,
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 1));
                        },
                      ),
                    ),
                    const SizedBox(width: gap),
                    SizedBox(
                      width: buttonWidth,
                      child: AppAsyncLoadingButton(
                        title: "View Route",
                        icon: Icons.map,
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                        borderRadius: 8,
                        size: ButtonSize.small,
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 1));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
