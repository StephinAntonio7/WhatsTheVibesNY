import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/ProfileScreen/profile_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';

class CreateScreen extends StatelessWidget {
  static const Color deepPurple = Color.fromARGB(255, 166, 163, 171);

  final TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController vibeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 231, 234),
      appBar: AppBar(
        title: Text(
          'Create An Event',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: vibeController,
                  decoration: InputDecoration(labelText: 'Vibe'),
                ),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(labelText: 'Time'),
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Ticket Price'),
                ),
                TextFormField(
                  controller: imageController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => postEvent(context),
                  child: Text('Post'),
                  style: ElevatedButton.styleFrom(),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 2:
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

  void postEvent(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5555/api/user-event'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': nameController.text,
        'vibe': vibeController.text,
        'date': dateController.text,
        'time': timeController.text,
        'location': locationController.text,
        'price': priceController.text,
        'image': imageController.text,
      }),
    );

    if (response.statusCode == 201) {
      final newEvent = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event posted successfully!')),
      );
      Navigator.pop(context, newEvent);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event posted successfully!')),
      );
    }
  }
}
