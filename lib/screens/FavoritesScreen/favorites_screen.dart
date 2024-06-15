import 'package:flutter/material.dart';
// import 'package:phase5_project/screens/EventScreen/event_screen.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/ProfileScreen/profile_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Events'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildBlock('Block 1', Colors.grey),
          _buildBlock('Block 2', Colors.grey),
          _buildBlock('Block 3', Colors.grey),
          _buildBlock('Block 4', Colors.grey),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Changed icon to user profile icon
            label: 'Profile', // Changed label to 'Profile'
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navigate to Favorites screen (if applicable)
              break;
            case 1:
              // Navigate to HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 2:
              // Navigate to ProfileScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildBlock(String text, Color color) {
    return Container(
      height: 100,
      color: color,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
