import 'package:apptoon/Pages/homepage.dart';
import 'package:apptoon/screen/home.dart';
import 'package:apptoon/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //name: 'toon', // ใช้ชื่อ Firebase App ที่มีอยู่แล้ว ในกรณีที่รันบนมือถือให้เปิด รันบน Chrome ให้ปิด
    options: FirebaseOptions(
      apiKey: " AIzaSyBg7mH2TTRJy1PyMRqbdRXXJj-0IgU_SEI ",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink, // สีหลัก
        ).copyWith(
          secondary: Color.fromARGB(255, 211, 33, 205), // สีรองที่คุณต้องการ
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
