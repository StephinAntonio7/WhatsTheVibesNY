import 'package:flutter/material.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
        children: [
          // User's name at the top
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://example.com/avatar.png'),
                ),
                SizedBox(width: 16),
                Text(
                  'Stephin Roberts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Upcoming Events section
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                EventCard(
                  vibe: 'Chill',
                  time: '8:00 PM',
                  date: 'March 12, 2023',
                  location: 'The Venue',
                  purchased: true,
                ),
              ],
            ),
          ),

          // Past Events section
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Past Events',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                EventCard(
                  vibe: 'Hype',
                  time: '7:00 PM',
                  date: 'February 22, 2023',
                  location: 'The Arena',
                  purchased: false,
                ),
              ],
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
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
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

class EventCard extends StatelessWidget {
  final String vibe;
  final String time;
  final String date;
  final String location;
  final bool purchased;

  const EventCard({
    Key? key,
    required this.vibe,
    required this.time,
    required this.date,
    required this.location,
    required this.purchased,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                vibe,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: purchased ? Colors.green : Colors.red,
                ),
              ),
              Spacer(),
              Text(
                purchased ? 'Ticket Purchased' : 'Ticket Not Purchased',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '$time - $date',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Text(
            location,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
