import 'package:cityseedapp/map.dart';
import 'package:cityseedapp/profilepage.dart';
import 'package:cityseedapp/task.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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

  // Method to show dialog
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900], // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("CITYSEED", style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("images/luka.jpg"),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                Colors.green[100], // Light green background color for the card
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //show pop up messages
              GestureDetector(
                onTap: () => _showDialog(
                  "Help Center",
                  "Here you can find various resources to assist you with using CITYSEED. For further assistance, please contact support. Support = +0304050607",
                ),
                child: SettingOption(text: "HELP CENTER"),
              ),
              GestureDetector(
                onTap: () => _showDialog(
                  "Language",
                  "You can select your preferred language from the settings. Currently, we support English, Malay, and Chinese.",
                ),
                child: SettingOption(text: "LANGUAGE"),
              ),
              GestureDetector(
                onTap: () => _showDialog(
                  "Security",
                  "Your security is our priority. Ensure you use a strong password and keep your account information private.",
                ),
                child: SettingOption(text: "SECURITY"),
              ),
              GestureDetector(
                onTap: () => _showDialog(
                  "FAQ",
                  "Here you can find answers to frequently asked questions. If your question isn't listed, feel free to reach out to us.",
                ),
                child: SettingOption(text: "FAQ"),
              ),
            ],
          ),
        ),
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

class SettingOption extends StatelessWidget {
  final String text;

  SettingOption({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Colors.green[900],
          thickness: 2.5,
        ),
      ],
    );
  }
}
