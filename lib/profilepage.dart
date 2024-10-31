//this is profile page

import 'package:cityseedapp/leaderboard.dart';
import 'package:cityseedapp/map.dart';
import 'package:cityseedapp/setting.dart';
import 'package:cityseedapp/task.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    switch (index) {
      case 0: //navigate to profilepage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );

      case 1: //navigate to taskpage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskPage()),
        );

      case 2: //navigate to settingpage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingScreen()),
        );

      case 3: //navigate to mappage
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
          IconButton(
            icon: Icon(Icons.search, color: Colors.green[900]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/luka.jpg'),
                ),
                SizedBox(width: 16), // Spacing between photo and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LUKA',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@lukaalienstage',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Points Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 8),
                  Text(
                    '7863 points',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle redeem functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'REDEEM',
                style: TextStyle(color: Colors.green[900]),
              ),
            ),
            SizedBox(height: 16),
            // Rewards Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRewardItem(
                    'Milk Tea', 'Nov 29, 2024', 2500, 'images/milktea.jpg'),
                _buildRewardItem(
                    'Choco Milk', 'Nov 14, 2024', 3000, 'images/chocomilk.jpg'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to LeaderboardPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'LEADERBOARD',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            // Ranking Section
            _buildRankingSection(),
            SizedBox(height: 24),
            // Current Standing
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.green[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('images/luka.jpg'),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Luka',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    '7863',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[900],
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

  Widget _buildRewardItem(
      String title, String date, int points, String imagePath) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 60,
            height: 60,
            color: Colors.white,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          date,
          style: TextStyle(color: Colors.grey[400], fontSize: 12),
        ),
        Text(
          '$points points',
          style:
              TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRankingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildRankingItem('Alex', 18476, 'images/alex.png'),
        _buildRankingItem('Emma', 24307, 'images/emma.png'),
        _buildRankingItem('Raise', 16748, 'images/raise.png'),
      ],
    );
  }

  Widget _buildRankingItem(String name, int points, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor:
              Colors.white, // Background color for better visibility
          backgroundImage: AssetImage(imagePath), // Display the specified image
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '$points',
          style:
              TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
