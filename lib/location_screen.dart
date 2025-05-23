import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final List<Map<String, dynamic>> stations = [
    {'name': 'STATION A', 'top': 200.0, 'left': 300.0},
    {'name': 'STATION B', 'top': 350.0, 'left': 60.0},
    {'name': 'STATION C', 'top': 100.0, 'left': 20.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stations Map')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Navigation')),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
              onTap: () => context.go('/'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Station A'),
              onTap:
                  () => context.go(
                    '/station/${Uri.encodeComponent('STATION A')}',
                  ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Station B'),
              onTap:
                  () => context.go(
                    '/station/${Uri.encodeComponent('STATION B')}',
                  ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Station C'),
              onTap:
                  () => context.go(
                    '/station/${Uri.encodeComponent('STATION C')}',
                  ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Static map image as background
          Positioned.fill(
            child: Image.asset('assets/map.png', fit: BoxFit.cover),
          ),
          // Search bar
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Where are you going to?',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Station buttons
          ...stations.map(
            (station) => Positioned(
              top: station['top'],
              left: station['left'],
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF298fb7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final encodedName = Uri.encodeComponent(station['name']);
                  context.push('/station/$encodedName');
                },
                child: Text(
                  station['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Static current location indicator
          Positioned(
            top: 250.0, // Adjust as needed
            left: 120.0, // Adjust as needed
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.my_location, color: Colors.red, size: 36),
                ),
                SizedBox(height: 4),
                Text(
                  "You are here",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
