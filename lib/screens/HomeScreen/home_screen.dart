import 'package:flutter/material.dart';
import 'package:phase5_project/screens/CreateScreen/create_screen.dart'; // Import the CreateScreen
import 'package:phase5_project/screens/EventScreen/event_screen.dart'; // Import the EventScreen
import 'package:phase5_project/screens/LoginScreen/login_screen.dart'; // Import the LoginScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 216, 226),
      appBar: AppBar(
        title: const Text("What's The Vibe?"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate to LoginScreen when the "Log Out" button is clicked
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // User's name at the top of the page
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Hello, User',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),

          // Gridview of images
          Expanded(
            child: GridView.count(
              crossAxisCount: 1, // Set to 1 for a single column
              children: List.generate(10, (index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to EventScreen when the grid item is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.grey,
                  ),
                );
              }),
            ),
          ),

          // "Host" button at the bottom of the page
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to CreateScreen when the "Host" button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateScreen()),
                );
              },
              child: const Text('Host'),
            ),
          ),
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
          if (index == 1) {
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
}
