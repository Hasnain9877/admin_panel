import 'package:flutter/material.dart';
import '../../common_widgets/app_button.dart';
import '../../constants/app_colors.dart';
import 'components/add_new_team.dart';
import 'components/team_table.dart';

class TeamManagementScreen extends StatefulWidget {
  const TeamManagementScreen({super.key});

  @override
  State<TeamManagementScreen> createState() => _TeamManagementScreenState();
}

class _TeamManagementScreenState extends State<TeamManagementScreen>
    with SingleTickerProviderStateMixin {
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


        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 0 : 4,
                vertical: isWide ? 0 : 8,
              ),
              child: isWide
                  ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _searchAndFilterPanel(isWide),
                  ),
                  Expanded(
                    child: _addDriverButton(isWide),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _searchAndFilterPanel(isWide),
                  SizedBox(height: 10),
                  _addDriverButton(isWide),
                ],
              ),
            ),
            SizedBox(height: isWide ? 20 : 10),
            Expanded(
              child: TeamTable(),
            ),
          ],
        );


  }

  Widget _searchAndFilterPanel(bool isWide) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: isWide ? 50 : 44,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search teams...',
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: isWide ? 10 : 6),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 0,
            padding: EdgeInsets.symmetric(
                horizontal: isWide ? 20 : 10, vertical: isWide ? 16 : 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          icon: const Icon(Icons.filter),
          label: const Text("Filter"),
        ),
      ],
    );
  }

  Widget _addDriverButton(bool isWide) {
    return Align(
      alignment: isWide ? Alignment.centerRight : Alignment.center,
      child: SizedBox(
        width: isWide ? 200 : double.infinity,
        child: AppAsyncLoadingButton(
          onTap: () {
            showAddNewTeamDialog(context);
         //   Navigator.push(context, MaterialPageRoute(builder: (context) => showAddNewTeamDialog()));
          },
          child: const Text('Add Driver', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}