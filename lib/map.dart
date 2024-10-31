import 'package:cityseedapp/profilepage.dart';
import 'package:cityseedapp/setting.dart';
import 'package:cityseedapp/task.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to ProfilePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );

      case 1:
        // Navigate to TaskPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskPage()),
        );

      case 2:
        // Navigate to SettingScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingScreen()),
        );

      case 3:
        // Navigate to MapPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('CITYSEED', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("images/luka.jpg"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          // Background Map Image
          Positioned.fill(
            child: Image.asset(
              'images/map.png', // map path
              fit: BoxFit.cover,
            ),
          ),
          // Search Bar
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.green[900]),
                ),
              ),
            ),
          ),
          // Zoom Controls
          Positioned(
            right: 16,
            top: 120,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.green[900],
                  onPressed: () {
                    // Add zoom in functionality here
                  },
                  child: Icon(Icons.zoom_in, color: Colors.white),
                ),
                SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.green[900],
                  onPressed: () {
                    // Add zoom out functionality here
                  },
                  child: Icon(Icons.zoom_out, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[900], // Sets background color
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language, color: Colors.white),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green[900],
          unselectedItemColor: Colors.white54,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
