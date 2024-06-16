import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phase5_project/screens/EventScreen/event_screen.dart';
import 'package:phase5_project/screens/LoginScreen/login_screen.dart';
import 'package:phase5_project/screens/CreateScreen/create_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';
import 'package:phase5_project/screens/ProfileScreen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = '';
  var data;
  String output = '';
  String errorMessage = '';
  Map<String, bool> favorites = {};
  List events = [];
  List searchResults = [];
  TextEditingController searchController = TextEditingController();

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
        setState(() {
          errorMessage = 'Failed to load events';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> searchEvents(String keyword) async {
    setState(() {
      output = 'Searching...';
    });

    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:5555/api/events?search=$keyword'));
      if (response.statusCode == 200) {
        setState(() {
          searchResults = (jsonDecode(response.body) as List).where((event) {
            return event['vibe'].toLowerCase().contains(keyword.toLowerCase());
          }).toList();
          output =
              'Search results for "$keyword": ${searchResults.length} events found';
        });
      } else {
        setState(() {
          errorMessage = 'Failed to search events';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> postUserEvent(Map<String, dynamic> eventData) async {
    try {
      await http.post(
        Uri.parse('http://127.0.0.1:5555/api/user-event'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(eventData),
      );
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
                  'Hello, Stephin',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          // TextField and Search Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter keywords to search events...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String keyword = searchController.text.trim();
                    if (keyword.isNotEmpty) {
                      searchEvents(keyword);
                    }
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Text(output),
          if (errorMessage.isNotEmpty)
            Text(errorMessage, style: const TextStyle(color: Colors.red)),
          // Display either static images or search results
          Expanded(
            child: searchResults.isEmpty
                ? GridView.count(
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
                  )
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return _buildEventItem(
                        searchResults[index]['name'],
                        searchResults[index]['image'],
                      );
                    },
                  ),
          ),
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
            icon: Icon(Icons.person), // Changed icon to user profile icon
            label: 'Profile', // Changed label to 'Profile'
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
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
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
        setState(() {
          errorMessage = 'Failed to load event details';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }
}
