import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phase5_project/screens/EventScreen/event_screen.dart';
import 'package:phase5_project/screens/LoginScreen/login_screen.dart';
import 'package:phase5_project/screens/CreateScreen/create_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart'; // Import FavoritesScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = '';
  var data;
  String output = 'Initial Output';
  String errorMessage = '';
  Map<String, bool> favorites = {};
  List events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:5555/api/events'));
      if (response.statusCode == 200) {
        setState(() {
          events = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> postUserEvent(Map<String, dynamic> eventData) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5555/api/user-event'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(eventData),
      );
      if (response.statusCode == 200) {
        // Handle success
      } else {
        throw Exception('Failed to post event');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

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
          // TextField and Fetch Button
          Center(
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      url = 'http://127.0.0.1:5555/api?query=' + value;
                    });
                  },
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      data = await fetchData(url);
                      var decoded = jsonDecode(data);
                      setState(() {
                        output = decoded['output'];
                      });
                    } catch (e) {
                      setState(() {
                        errorMessage = e.toString();
                      });
                    }
                  },
                  child: const Text('Fetch ASCII Value'),
                ),
                Text(output),
                if (errorMessage.isNotEmpty)
                  Text(errorMessage, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
          // GridView of static images
          Expanded(
            child: GridView.count(
              crossAxisCount: 1, // Set to 1 for a single column
              children: [
                _buildEventItem(
                  'No Type Part III',
                  'assets/images/No Type Part III.JPEG',
                ),
                _buildEventItem(
                  'Brunch Party',
                  'assets/images/Brunch Party.jpg',
                ),
                _buildEventItem(
                  '1 Motif Party',
                  'assets/images/1 Motif Party.jpeg',
                ),
              ],
            ),
          ),
          // GridView of dynamic events
          if (events.isNotEmpty)
            Expanded(
              child: GridView.builder(
                itemCount: events.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return _buildEventItem(
                    events[index]['name'],
                    events[index]['image'],
                  );
                },
              ),
            )
          else
            const Center(child: Text('No events available')),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
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
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoritesScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildEventItem(String eventName, String imagePath) {
    bool isFavorite = favorites[eventName] ?? false;
    return GestureDetector(
      onTap: () => navigateToEvent(eventName, context),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  favorites[eventName] = !isFavorite;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '$eventName ${isFavorite ? 'removed from' : 'added to'} favorites!',
                    ),
                  ),
                );
                // Posting the favorite event to the backend
                postUserEvent(
                    {'eventName': eventName, 'isFavorite': !isFavorite});
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  void navigateToEvent(String eventName, BuildContext context) async {
    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:5555/api/event/$eventName'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(
              name: data['name'],
              vibe: data['vibe'],
              time: data['time'],
              date: data['date'],
              location: data['location'],
              price: data['price'],
              image: data['image'],
            ),
          ),
        );
      } else {
        throw Exception('Failed to load event details');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }
}
