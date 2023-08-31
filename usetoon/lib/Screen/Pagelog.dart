import 'package:flutter/material.dart';
import 'package:usetoon/Screen/Pagereg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png"), // แสดงภาพโลโก้
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Username"), // ช่องกรอกชื่อผู้ใช้
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Password"), // ช่องกรอกรหัสผ่าน
                obscureText: true, // ทำให้ข้อความซ่อน
              ),
              //
              //
//****************************ส่วนของลงเข้าสู่ระบบ******************************** */
              //
              //
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.login), // ไอคอนของปุ่ม
                label: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegPage(); // นำทางไปยังหน้าการลงทะเบียน
                  }));
                }, // การกระทำเมื่อปุ่มถูกคลิก
                //
                //
//****************************ส่วนของลงทะเบียน********************************* */
                //
                //
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.add), // ไอคอนของปุ่ม
                label: Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegPage(); // นำทางไปยังหน้าการลงทะเบียน
                  }));
                }, // การกระทำเมื่อปุ่มถูกคลิก
              ),
            ],
          ),
        ),
      ),
    );
  }
}
