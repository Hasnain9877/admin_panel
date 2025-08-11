import 'package:flutter/material.dart';

Future<void> showAddNewTeamDialog(BuildContext context) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
  );

  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        double cardWidth = MediaQuery.of(context).size.width < 500 ? double.infinity : 500;
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Add New Team", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  SizedBox(height: 24),

                  // Team Name
                  Text("Team Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter team name",
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Assign Drivers
                  Text("Assign Drivers", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search drivers...",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Assigned Drivers Chips
                  Wrap(
                    spacing: 10,
                    children: [
                      _driverChip("Driver 1"),
                      _driverChip("Driver 2"),
                      _driverChip("Driver 3"),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Zone Coverage
                  Text("Zone Coverage", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Select zones",
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),
                      items: [],
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(height: 20),

                  // Supervisor
                  Text("Supervisor", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search supervisor...",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        child: Text("Add Team"),
                        onPressed: () {
                          // TODO: Add submit logic
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}

Widget _driverChip(String name) {
  return Chip(
    label: Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
    backgroundColor: Colors.grey[100],
    deleteIcon: Icon(Icons.close, size: 18),
    onDeleted: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
  );
}