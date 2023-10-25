import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ServiceCenterList(),
    );
  }
}

class ServiceCenterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf7c910),
        title: Text('Service Centers', style: TextStyle(color: Colors.black)),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Service Centers',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Service Centers'),
                    style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://i.pinimg.com/564x/91/c3/d1/91c3d130f87bb7d1ef43cab2e3854659.jpg', // Use actual image URLs
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Service Center 0${index + 1}'),
                        Text('SC 0${index + 1}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Spare Parts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Request'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Assistant'),
        ],
      ),
    );
  }
}
