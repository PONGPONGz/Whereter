import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StationScreen extends StatelessWidget {
  final String stationName;
  const StationScreen({super.key, required this.stationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Color(0xFF6ea3b7),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 32),
                    onPressed: () => context.go('/'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    stationName,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Water Quality
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WATER QUALITY',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('pH', style: TextStyle(fontSize: 18)),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('TDS', style: TextStyle(fontSize: 18)),
                              Text('120 ppm', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(width: 40),
                          Icon(
                            Icons.emoji_emotions,
                            color: Colors.green,
                            size: 60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            // Review
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blue[100],
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'POP SIAM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('GOOD, NICE', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            // Notice
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(12),
              color: Colors.grey[400],
              child: Row(
                children: [
                  Icon(Icons.water_drop, color: Colors.blue, size: 32),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Please bring your own reusable bottle',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            // Maintenance
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Icon(Icons.build, size: 32),
                  SizedBox(width: 10),
                  Text(
                    'Next Maintenance: 12 Apr 2025',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Unlock Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'UNLOCK STATION',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
