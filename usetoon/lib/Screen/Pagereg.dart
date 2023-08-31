import 'package:flutter/material.dart';
import 'package:usetoon/model/profile.dart';

class RegPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Profile profile =
      Profile(username: '', email: '', password: '', confirmpassword: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "UserName"),
                  onSaved: (String? username) {
                    // เปลี่ยนเป็น String?
                    profile.username = username ??
                        ""; // ใช้ null-aware operator หรือกำหนดค่าเริ่มต้นให้เป็น ""
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? email) {
                    profile.email = email ?? "";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                  obscureText: true,
                  onSaved: (String? password) {
                    profile.password = password ?? "";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "confirm password"),
                  obscureText: true,
                  onSaved: (String? confirmPassword) {
                    profile.confirmpassword = confirmPassword ?? "";
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      formKey.currentState?.save();
                      formKey.currentState?.reset();
                      print(
                          "User = ${profile.username} email = ${profile.email} password = ${profile.password} confirm password = ${profile.confirmpassword}");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
