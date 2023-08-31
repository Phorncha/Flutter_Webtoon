import 'package:flutter/material.dart';
import 'package:usetoon/Screen/Pagelog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage()); // กำหนดหน้าจอหลักเป็น PagelogScreen
  }
}
