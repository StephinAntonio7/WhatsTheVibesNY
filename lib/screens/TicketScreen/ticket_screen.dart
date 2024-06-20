import 'package:flutter/material.dart';

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
          width: 200, // Adjusted width
          height: 200, // Adjusted height
          child: Image.asset(
            'assets/images/qr_code.jpg',
            fit: BoxFit.contain, // Ensure the image fits within the box
          ),
        ),
      ),
    );
  }
}
