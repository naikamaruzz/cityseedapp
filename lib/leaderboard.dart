import 'package:cityseedapp/profilepage.dart';
import 'package:flutter/material.dart';
import 'task.dart';
import 'setting.dart';
import 'map.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //navigate to profilepage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        title: Text(
          'CITYSEED',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('images/luka.jpg'),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFF3F3B36),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                //show top 3
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTopUser(
                      'Alex', 18476, 2, Colors.blue, 'images/alex.png'),
                  _buildTopUser(
                      'Emma', 24307, 1, Colors.orange, 'images/emma.png',
                      crown: true),
                  _buildTopUser(
                      'Raise', 16748, 3, Colors.green, 'images/raise.png'),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF47543F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  children: [
                    _buildListUser('Till', 1124, 'images/till.png'),
                    _buildListUser('Ivan', 875, 'images/ivan.png',
                        isDecreasing: true),
                    _buildListUser('Hyuna', 774, 'images/hyuna.png'),
                    _buildListUser('Mizi', 723, 'images/sua.png'),
                    _buildListUser('Dewey', 559, 'images/dewey.png',
                        isDecreasing: true),
                  ],
                ),
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

  Widget _buildTopUser(
      String name, int score, int rank, Color color, String imagePath,
      {bool crown = false}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: rank == 1 ? 35 : 30,
              backgroundColor: color.withOpacity(0.2),
              child: CircleAvatar(
                radius: rank == 1 ? 30 : 25,
                backgroundImage: AssetImage(imagePath),
                child: crown
                    ? Icon(Icons.star, color: Colors.yellow, size: 24)
                    : null,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          score.toString(),
          style: TextStyle(
              color: color, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '@username',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildListUser(String name, int score, String imagePath,
      {bool isDecreasing = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 20,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '@username',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                score.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                isDecreasing ? Icons.arrow_downward : Icons.arrow_upward,
                color: isDecreasing ? Colors.red : Colors.green,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
