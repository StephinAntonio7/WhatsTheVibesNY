import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phase5_project/screens/EventScreen/event_screen.dart';
import 'package:phase5_project/screens/LoginScreen/login_screen.dart';
import 'package:phase5_project/screens/CreateScreen/create_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';
import 'package:phase5_project/screens/ProfileScreen/profile_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_state.dart'; // Import the shared state

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
          // Display search results if any, else display all events
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 16.0, // Horizontal space between items
                mainAxisSpacing: 16.0, // Vertical space between items
              ),
              itemCount: searchResults.isNotEmpty
                  ? searchResults.length
                  : events.length,
              itemBuilder: (context, index) {
                var event = searchResults.isNotEmpty
                    ? searchResults[index]
                    : events[index];
                String eventName = event['name'];
                String imagePath = event['image'];
                return _buildEventItem(eventName, imagePath, event);
              },
            ),
          ),
          // Host Event Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final newEvent = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateScreen()),
                );
                if (newEvent != null) {
                  setState(() {
                    events.add(newEvent);
                  });
                }
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

  Widget _buildEventItem(String eventName, String imagePath,
      [Map<String, dynamic>? eventDetails]) {
    bool isFavorite = favoritesState.favorites.containsKey(eventName);
    return GestureDetector(
      onTap: () => navigateToEvent(eventName, context),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: imagePath.startsWith('assets')
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        height: 100,
                        color: Colors.grey,
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        ),
                      );
                    },
                  )
                : Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        height: 100,
                        color: Colors.grey,
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
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
                  favoritesState.toggleFavorite(eventName, eventDetails ?? {});
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '$eventName ${isFavorite ? 'removed from' : 'added to'} favorites!',
                    ),
                  ),
                );
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
