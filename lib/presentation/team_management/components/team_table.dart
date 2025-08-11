import 'package:flutter/material.dart';

class TeamTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [

              _buildHeader(),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                ),
              ),
              SizedBox(height: 8,),
              _buildRow(
                teamName: "North Zone Team",
                teamId: "T001",
                membersCount: 8,
                membersAvatars: [1, 2, 3], // Replace with your images
                extraMembers: 5,
                supervisorAvatar: 4, // Replace with your image
                supervisor: "John Smith",
                zoneCoverage: ["North Metro", "Suburban Area", "+2 more"],
              ),
              SizedBox(height: 8,),
              _buildRow(
                teamName: "South Zone Team",
                teamId: "T002",
                membersCount: 6,
                membersAvatars: [5, 6], // Replace with your images
                extraMembers: 4,
                supervisorAvatar: null,
                supervisor: "Not Assigned",
                zoneCoverage: ["South Metro", "Shopping District"],
              ),
              SizedBox(height: 8,),
              _buildRow(
                teamName: "East Zone Team",
                teamId: "T003",
                membersCount: 5,
                membersAvatars: [7, 8], // Replace with your images
                extraMembers: 3,
                supervisorAvatar: 9, // Replace with your image
                supervisor: "Sarah Johnson",
                zoneCoverage: ["East Metro", "Business District"],
              ),
            ],
          ),
        );


  }

  Widget _buildHeader() {
    return Container(
    //  padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text("Team Name", style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 2, child: Text("Members", style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 2, child: Text("Supervisor", style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 3, child: Text("Zone Coverage", style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 2, child: Text("Actions", style: TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String teamName,
    required String teamId,
    required int membersCount,
    required List<int> membersAvatars,
    required int extraMembers,
    required int? supervisorAvatar,
    required String supervisor,
    required List<String> zoneCoverage,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(

        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          // Team Name & ID
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  radius: 18,
                  child: Icon(Icons.group, color: Colors.blue),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(teamName, style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("ID: $teamId", style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
          // Members
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text("$membersCount\nDrivers", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 10),
                ...membersAvatars.map((i) => Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: CircleAvatar(backgroundColor: Colors.grey[300], radius: 12),
                )),
                SizedBox(width: 2),
                Text("+$extraMembers", style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
          // Supervisor
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (supervisorAvatar != null)
                  CircleAvatar(backgroundColor: Colors.orange[200], radius: 15),
                SizedBox(width: 8),
                Text(supervisor, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          // Zone Coverage
          Expanded(
            flex: 3,
            child: Wrap(
              spacing: 8,
              children: zoneCoverage.map((zone) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(zone, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              )).toList(),
            ),
          ),
          // Actions
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon: Icon(Icons.edit, size: 20), onPressed: () {}),
                IconButton(icon: Icon(Icons.person_add_alt_1, size: 20), onPressed: () {}),
                IconButton(icon: Icon(Icons.delete_outline, size: 20), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}