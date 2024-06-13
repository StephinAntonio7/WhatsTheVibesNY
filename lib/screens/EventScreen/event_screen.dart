import 'package:flutter/material.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/CheckoutScreen/checkout_screen.dart';

class EventScreen extends StatelessWidget {
  final String vibe;
  final String timeDate;
  final String location;
  final String ticketPrice;

  const EventScreen({
    Key? key,
    required this.vibe,
    required this.timeDate,
    required this.location,
    required this.ticketPrice,
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
                  "Vibe:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(vibe),
                SizedBox(height: 10),
                Text(
                  "Time & Date:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(timeDate),
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
                Text(ticketPrice),
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
