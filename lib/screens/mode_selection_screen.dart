import 'package:flutter/material.dart';
import 'station_mode_screen.dart';
import 'parent_mode_screen.dart';

class ModeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Mode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StationModeScreen()),
                );
              },
              child: Text('Station Mode'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParentModeScreen()),
                );
              },
              child: Text('Parent Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
