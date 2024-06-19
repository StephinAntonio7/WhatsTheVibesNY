import 'package:flutter/material.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_state.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/ProfileScreen/profile_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 220, 216, 226), // Set the background color to light grey
      appBar: AppBar(
        title: const Text('My Favorite Events'),
      ),
      body: AnimatedBuilder(
        animation: favoritesState,
        builder: (context, child) {
          if (favoritesState.favorites.isEmpty) {
            return Center(
              child: Text('No favorite events'),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 16.0, // Horizontal space between items
              mainAxisSpacing: 16.0, // Vertical space between items
            ),
            itemCount: favoritesState.favorites.length,
            itemBuilder: (context, index) {
              String eventName = favoritesState.favorites.keys.elementAt(index);
              Map<String, dynamic> eventDetails =
                  favoritesState.favorites[eventName]!;
              return GestureDetector(
                onTap: () {
                  // Navigate to event details screen if needed
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set container background to white
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      eventDetails['image'] != null
                          ? eventDetails['image'].startsWith('assets')
                              ? Image.asset(
                                  eventDetails['image'],
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
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
                                  eventDetails['image'],
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
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
                          : Container(
                              height: 100,
                              color: Colors.grey,
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                      SizedBox(height: 8),
                      Text(
                        eventDetails['name'] ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          favoritesState.toggleFavorite(
                              eventName, eventDetails);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
        currentIndex: 0, // Set the current index to the Favorites screen
        onTap: (int index) {
          switch (index) {
            case 0:
              // Stay on the Favorites screen
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
}
