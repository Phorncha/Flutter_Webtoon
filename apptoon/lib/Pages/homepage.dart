import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลจาก Firebase Firestore'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('storys').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var document = documents[index];
              var data = document.data() as Map<String, dynamic>;
              // แสดงข้อมูลที่คุณต้องการแสดง
              return ListTile(
                title: Text(data['ชื่อฟิลด์']),
                subtitle: Text(data['รายละเอียด']),
              );
            },
          );
        },
      ),
    );
  }
}
