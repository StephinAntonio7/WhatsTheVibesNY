import 'package:flutter/material.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/CheckoutScreen/checkout_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';

class EventScreen extends StatelessWidget {
  final String name;
  final String vibe;
  final String time;
  final String date;
  final String location;
  final String price;
  final String image;

  const EventScreen({
    Key? key,
    required this.name,
    required this.vibe,
    required this.time,
    required this.date,
    required this.location,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        children: [
          // Create a sky blue gradient background
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 176, 190, 197),
                  Color.fromARGB(255, 120, 144, 156),
                ],
              ),
            ),
            child: Center(
              child: Text(
                "Event Details",
                style: TextStyle(
                  fontFamily: 'Old English Text MT',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Include fields for Vibe, Time & Date, Location, Ticket Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(name),
                Text(
                  "Vibe:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(vibe),
                SizedBox(height: 10),
                Text(
                  "Time:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(time),
                Text(
                  "Date:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date),
                SizedBox(height: 10),
                Text(
                  "Location:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(location),
                SizedBox(height: 10),
                Text(
                  "Ticket Price:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(price),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Include amber-colored Buy Ticket button with shadow and rounded edges
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.amber[400],
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 217, 170, 28),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Navigate to CheckoutScreen when the button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Buy Ticket",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
}
