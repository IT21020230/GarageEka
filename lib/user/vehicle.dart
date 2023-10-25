import 'package:flutter/material.dart';
import 'package:garage_eka/shop/item.dart';

class MyVehiclePage extends StatefulWidget {
  @override
  _MyVehiclePageState createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf7c910),
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text('My Vehicle', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildVehicleSection(),
            SizedBox(height: 20),
            _buildPartsSection('Engine parts matches to your vehicle'),
            SizedBox(height: 20),
            _buildPartsSection('Car interior parts matches to your vehicle'),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleSection() {
    return Column(
      children: [
        Image.network(
          'https://hips.hearstapps.com/hmg-prod/images/2021-bmw-m4-manual-108-1619673989.jpg?crop=0.775xw:0.655xh;0.117xw,0.152xh&resize=1200:*',
          fit: BoxFit.cover,
          height: 200,
        ),
        SizedBox(height: 10),
        Text('BMW M4'),
      ],
    );
  }

  Widget _buildPartsSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildPartItem(context)),
            SizedBox(width: 10),
            Expanded(child: _buildPartItem(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildPartItem(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://hips.hearstapps.com/hmg-prod/images/2021-bmw-m4-manual-108-1619673989.jpg?crop=0.775xw:0.655xh;0.117xw,0.152xh&resize=1200:*',
          height: 100,
        ),
        SizedBox(height: 5),
        Text('Steering wheel covers'),
        Text('Upto 50% off'),
        SizedBox(height: 5),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Item()),
              );
            },
            child: Text('ADD TO CART')),
      ],
    );
  }
}
