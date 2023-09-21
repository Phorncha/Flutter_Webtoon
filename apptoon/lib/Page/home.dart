import 'package:apptoon/Page/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          // เพิ่ม IconButton สำหรับออกจากระบบ
          IconButton(
            icon: Icon(Icons.exit_to_app), // ไอคอน Logout
            onPressed: () {
              // เรียกเมธอด signOut เมื่อกดปุ่ม
              signOut(context);
            },
          ),
        ],
      ),
      
      body: Center(
        child: Text('Welcome to the Home!'),
      ),
    );
  }

   // เมธอดสำหรับออกจากระบบ
  void signOut(BuildContext context) async {
    await _auth.signOut();
    // เมื่อออกจากระบบแล้วให้ย้อนกลับไปหน้า Login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
