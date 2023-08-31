import 'package:flutter/material.dart';

class RegPage extends StatelessWidget {
  RegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "UserName"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "password"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "confirm password"),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
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
