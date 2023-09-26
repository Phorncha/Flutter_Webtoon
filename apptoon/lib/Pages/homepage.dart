import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลจาก Firebase Firestore'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('HK').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('เกิดข้อผิดพลาด: ${snapshot.error.toString()}'),
            );
          }
          var documents = snapshot.data?.docs;
          if (documents == null || documents.isEmpty) {
            return Center(
              child: Text('ไม่พบข้อมูลใน collection "storys"'),
            );
          }

          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0, // กำหนดความสูของ Carousel
                  enlargeCenterPage:
                      true, // ทำให้รูปภาพในสไลด์กลายเป็นขนาดใหญ่ในสไลด์กลายเป็นขนาดใหญ่
                  autoPlay: false, // สไลด์อัตโนมัติ
                  aspectRatio: 16 / 9, // สัดส่วนกว้างต่อสูงของ Carousel
                  autoPlayInterval:
                      Duration(seconds: 2), // กำหนดระยะเวลาในการนำสไลด์
                  autoPlayCurve:
                      Curves.fastOutSlowIn, // ความเร็วของการนำสไลด์อัตโนมัติ
                  autoPlayAnimationDuration: Duration(
                      milliseconds: 800), // ระยะเวลาของการนำสไลด์อัตโนมัติ
                ),
                items: documents.map((document) {
                  //ดึงข้อมูลจาก firebase
                  var data = document.data() as Map<String, dynamic>;
                  var title = data['title'];
                  var day = data['day'];
                  var id = document.id; // ดึง ID ของเอกสาร
                  var author = data['author'];

                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title: $title'),
                                  Text('Day: $day'),
                                  Text('ID: $id'),
                                  Text('author: $author'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
