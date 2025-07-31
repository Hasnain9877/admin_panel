import 'package:flutter/material.dart';

class AddDriverApp extends StatelessWidget {
  const AddDriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add a Driver',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
      ),
      home: AddDriverScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AddDriverScreen extends StatefulWidget {
  const AddDriverScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddDriverScreenState createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  String selectedTransport = 'Car';
  bool unlimitedCapacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add a Driver'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Basic Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'Name')),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 30),
            Text(
              "Transportation",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Walking', 'Bicycle', 'Motorcycle', 'Car', 'Truck']
                  .map((transport) {
                    return ChoiceChip(
                      label: Text(transport),
                      selected: selectedTransport == transport,
                      onSelected: (_) {
                        setState(() {
                          selectedTransport = transport;
                        });
                      },
                    );
                  })
                  .toList(),
            ),

            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Year, Make, Model'),
            ),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'License Plate')),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'Color')),

            SizedBox(height: 30),
            Text(
              "Teams",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Assigned to East'),
            ),

            SizedBox(height: 30),
            Text(
              "SMS & Tracking Page (optional)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'Display Name')),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.grey[200]),
                  ElevatedButton(onPressed: () {}, child: Text('Upload Photo')),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Route Optimization (optional)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Routing Address'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Apartment, Building, Suite',
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text("Use coordinates"),
              value: false,
              onChanged: (val) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Capacity'),
              keyboardType: TextInputType.number,
            ),
            CheckboxListTile(
              title: Text("Unlimited capacity"),
              value: unlimitedCapacity,
              onChanged: (val) {
                setState(() {
                  unlimitedCapacity = val ?? false;
                });
              },
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text('Cancel')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text('Add Driver')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
