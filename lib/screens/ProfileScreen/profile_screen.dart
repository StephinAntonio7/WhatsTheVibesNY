import 'package:flutter/material.dart';
import 'package:phase5_project/screens/HomeScreen/home_screen.dart';
import 'package:phase5_project/screens/FavoritesScreen/favorites_screen.dart';
// import 'package:phase5_project/screens/TicketScreen/ticket_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 220, 216, 226), // Set background color
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  backgroundColor: Colors.lightGreen,
                  // child: Icon(
                  //   Icons.person,
                  //   color: Colors.white,
                  //   size: 30,
                  // ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicketScreen()),
              );
            },
            child: Container(
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
                    vibe: 'Suede',
                    time: '9:00 PM',
                    date: 'June 22nd, 2024',
                    location: 'Record Room',
                    purchased: true,
                  ),
                ],
              ),
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
                  vibe: 'The Lay Out',
                  time: '1:00 PM',
                  date: 'June 16th, 2024',
                  location: 'Fort Greene Park',
                  purchased: false,
                ),
                SizedBox(height: 4), // Added space between EventCards
                EventCard(
                  vibe: 'Gov Ball',
                  time: '1:00 PM',
                  date: 'June 5th, 2024',
                  location: 'Flushing Meadows Corona Park',
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
        currentIndex: 2, // Set current index to ProfileScreen
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
              // Stay on ProfileScreen
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
                purchased ? 'Ticket Purchased' : '',
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

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          child: Image.asset(
            'assets/images/qr_code.jpg',
            fit: BoxFit.contain, // Ensure the image fits within the box
          ),
        ),
      ),
    );
  }
}
