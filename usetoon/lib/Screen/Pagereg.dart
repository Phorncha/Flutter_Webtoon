import 'package:flutter/material.dart';
import 'package:usetoon/model/profile.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile =
      Profile(username: '', email: '', password: '', confirmpassword: '');

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

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
                    profile.username = username ?? "";
                  },
                ),
                //////////////////////////////////////////////////////
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? email) {
                    if (email == null || email.isEmpty) {
                      return 'ท่านยังไม่ได้ทำการป้อนอีเมล';
                    }
                    return null; // ส่งคืน null เมื่อข้อมูลถูกต้อง
                  },
                  onSaved: (String? email) {
                    profile.email = email ?? "";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "รหัสผ่าน",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_passwordVisible,
                  validator: (String? password) {
                    if (password == null || password.isEmpty) {
                      return "ท่านยังไม่ได้ทำการป้อนรหัสผ่าน";
                    } else if (password.length < 6) {
                      return "รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร";
                    } else if (!containsUppercaseLetter(password) ||
                        !containsLowercaseLetter(password)) {
                      return "รหัสผ่านต้องประกอบด้วยตัวอักษรตัวใหญ่และตัวเล็ก";
                    }
                    return null;
                  },
                  onSaved: (String? password) {
                    profile.password = password ?? "";
                  },
                ),
                SizedBox(height: 16),
                ////////////////////////////////////////
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: "ยืนยันรหัสผ่าน",
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         _confirmPasswordVisible
                //             ? Icons.visibility
                //             : Icons.visibility_off,
                //         color: Colors.black,
                //       ),
                //       onPressed: () {
                //         setState(() {
                //           _confirmPasswordVisible = !_confirmPasswordVisible;
                //         });
                //       },
                //     ),
                //   ),
                //   obscureText: !_confirmPasswordVisible,
                //   validator: (String? confirmPassword) {
                //     if (confirmPassword == null || confirmPassword.isEmpty) {
                //       return "ท่านยังไม่ได้ทำการป้อนรหัสผ่าน";
                //     } else if (confirmPassword.trim() !=
                //         profile.password.trim()) {
                //       return "รหัสผ่านไม่ตรงกัน";
                //     }
                //     return null;
                //   },
                //   onSaved: (String? confirmPassword) {
                //     profile.confirmpassword = confirmPassword ?? "";
                //   },
                // ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('ลงทะเบียนสำเร็จ'),
                          ),
                        );
                        // print(
                        //     "User = ${profile.username} email = ${profile.email} password = ${profile.password} confirmpassword = ${profile.password}");
                        print(
                            "User = ${profile.username} email = ${profile.email} password = ${profile.password}");
                        formKey.currentState?.reset();
                      }
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

  bool containsUppercaseLetter(String value) {
    return value.contains(new RegExp(r'[A-Z]'));
  }

  bool containsLowercaseLetter(String value) {
    return value.contains(new RegExp(r'[a-z]'));
  }
}
