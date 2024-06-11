import 'package:flutter/material.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';

class CreateScreen extends StatelessWidget {
  static const Color deepPurple = Color.fromARGB(255, 166, 163, 171);

  final TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color:
        Colors.white, // Change title text color to white for better visibility
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color of Scaffold to white
      appBar: AppBar(
        title: Text(
          'Create An Event',
          style: titleStyle,
        ),
        backgroundColor: deepPurple,
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Vibe',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Time',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ticket Price',
                  ),
                ),
                const SizedBox(height: 20), // Add space here
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: deepPurple, // Corrected to backgroundColor
                  ),
                ),
                const SizedBox(height: 20), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your post button logic here
                  },
                  child: Text('Post'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: deepPurple, // Corrected to backgroundColor
                  ),
                ),
              ],
            ),
          ),
        ),
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
