import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Manga List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('ชื่อเรื่อง 1'), // Replace with manga title
              subtitle: Text('คะแนน 1'), // Replace with manga score
              leading:
                  Image.asset('images/logo1.png'), // Replace with manga image
              trailing: ElevatedButton(
                // Use ElevatedButton instead of FlatButton
                child: Text('อ่าน'), // Replace with desired action text
                onPressed: () {
                  // Handle button press for the first manga item
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ชื่อเรื่อง 2'), // Replace with manga title
              subtitle: Text('คะแนน 2'), // Replace with manga score
              leading:
                  Image.asset('images/logo1.png'), // Replace with manga image
              trailing: ElevatedButton(
                // Use ElevatedButton instead of FlatButton
                child: Text('อ่าน'), // Replace with desired action text
                onPressed: () {
                  // Handle button press for the second manga item
                },
              ),
            ),
          ),
          // Add more Card widgets for additional manga items here
        ],
      ),
    );
  }
}
