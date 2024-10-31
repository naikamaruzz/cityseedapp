//this is task page

import 'package:cityseedapp/map.dart';
import 'package:cityseedapp/profilepage.dart';
import 'package:cityseedapp/setting.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  void _onItemTapped(int index) {
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
        // Navigate to Settings Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingScreen()),
        );

      case 3:
        // Navigate to Map Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage()),
        );
    }
  }

  late TabController _tabController;
  bool isConnected = false; // Initial state is "Disconnected"
  int _selectedIndex = 0;

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
    return Scaffold(
      backgroundColor: Color(0xFF3B2D35),
      appBar: AppBar(
        backgroundColor: Color(0xFF3B2D35),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("CITYSEED", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("images/luka.jpg"),
          ),
          SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'TRANSPORT',
                  style: TextStyle(color: Colors.green[900]),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'RECYCLING',
                  style: TextStyle(color: Colors.green[900]),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Transport tab content: Show connected/disconnected state
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isConnected
                      ? Icons.bluetooth_connected
                      : Icons.bluetooth_disabled,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                SizedBox(height: 20),
                Text(
                  isConnected ? "CONNECTED" : "DISCONNECTED",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  isConnected
                      ? "YOU HAVE STARTED YOUR TRIP"
                      : "PLEASE STAY WITHIN 50M RADIUS",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 30),
                Switch(
                  value: isConnected,
                  onChanged: (value) {
                    setState(() {
                      isConnected = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
          ),
          // Recycling tab content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    'RECYCLE',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'CLAIM YOUR POINTS NOW !!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'images/qr_code.png',
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[900], // Sets the background color to green
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
