import 'package:flutter/material.dart';
// import 'package:phase5_project/screens/EventScreen/event_screen.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';

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
            icon: Icon(Icons.email),
            label: 'Messages',
          ),
        ],
        onTap: (int index) {
          // Handle taps on the bottom navigation bar items
          if (index == 0) {
            // If the favorites icon is tapped (index 0), navigate to FavoritesScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoritesScreen()),
            );
          } else if (index == 1) {
            // If the home icon is tapped (index 1), navigate to HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
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
