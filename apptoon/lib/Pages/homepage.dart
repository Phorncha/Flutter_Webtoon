import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลจาก Firebase Firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('storys').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('เกิดข้อผิดพลาด: ${snapshot.error.toString()}'),
            );
          }

          final documents = snapshot.data?.docs;

          if (documents == null || documents.isEmpty) {
            return Center(
              child: Text('ไม่พบข้อมูลใน collection "storys"'),
            );
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index];
              final data = document.data() as Map<String, dynamic>;
              final title = data['title'];
              final day = data['day'];
              final id = data['id'];
              final imageUrl = data['imageUrl'];

              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: $title'),
                    Text('Day: $day'),
                    Text('ID: $id'),
                    Image.network(
                      imageUrl,
                      width: 100,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
