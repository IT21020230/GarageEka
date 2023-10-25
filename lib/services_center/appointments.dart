import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFf7c910),
        title: Text(
          'Service Centers',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "User's Appointments",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF484b9f)),
            ),
          ),
          ListTile(
            title: Text('Toyota Aqua'),
            subtitle: Text('17 - 09 - 2023\n9.00 am'),
            trailing: Chip(
              label: Text('Declined'),
              backgroundColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text('Toyota Aqua'),
            subtitle: Text('25 - 09 - 2023\n10.00 am'),
            trailing: Chip(
              label: Text('Approved'),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Spare Parts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Assistant',
          ),
        ],
      ),
    );
  }
}
