import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceSlotBookingPage extends StatefulWidget {
  @override
  _ServiceSlotBookingPageState createState() => _ServiceSlotBookingPageState();
}

class _ServiceSlotBookingPageState extends State<ServiceSlotBookingPage> {
  _ServiceSlotBookingPageState() {
    fetchBookedSlot();
  }
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  String? _brandValue = null; // to hold selected brand value
  String? _modelValue = null; // to hold selected model value

  String? selectedSlot;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? bookedSlot;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchBookedSlot() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('bookedSlots')
          .where('servicecenterid', isEqualTo: "456")
          .get();

      if (snapshot.docs.isNotEmpty) {
        Map<String, dynamic> data =
            snapshot.docs.first.data() as Map<String, dynamic>;

        setState(() {
          bookedSlot = data['time'];
        });
      }
    } catch (e) {
      print('Error fetching booked slot: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBookedSlot();
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    return "${now.month}/${now.day}/${now.year}";
  }

  void saveToFirestore() async {
    try {
      await firestore.collection('bookedSlots').add({
        'date': getCurrentDate(),
        'servicecenterid': '456',
        'time': selectedSlot,
        'name': _nameController.text,
        'mobile': _mobileController.text,
        'brand': _brandValue,
        'model': _modelValue,
      });
      print("Data saved successfully with auto-generated ID.");
    } catch (e) {
      print("Error saving data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> allTimes = [
      '8.00 am',
      '9.00 am',
      '10.00 am',
      '11.00 am',
      '1.00 pm',
      '2.00 pm',
      '4.00 pm'
    ];

    List<String> availableTimes =
        allTimes.where((time) => time != bookedSlot).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf7c910),
        title: Text('Service Centers'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ATI Auto Care',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text('Pick a time from available slots'),
                  SizedBox(height: 20),
                  DropdownButton<String>(
                    value: selectedSlot,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSlot = newValue!;
                      });
                    },
                    items: availableTimes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextField(
                    controller: _nameController, // Use controller here
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _mobileController, // Use controller here
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _brandValue,
                    items:
                        ['Option1', 'Option2', 'Option3'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Brand',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Save the selected value to the state
                      setState(() {
                        _brandValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _modelValue,
                    items:
                        ['Option1', 'Option2', 'Option3'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Model',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Save the selected value to the state
                      setState(() {
                        _modelValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('CANCEL'),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          saveToFirestore();
                        },
                        child: Text('Submit'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
