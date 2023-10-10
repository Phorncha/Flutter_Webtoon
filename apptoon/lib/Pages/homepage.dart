import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategoryButtons(),
            _buildRecommendedStories(),
            _buildAction(),
            _buildRomantic(),
            _buildComedy(),
            _buildFantasy(),
            _buildHorror(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Container(
      width: 400,
      color: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'หมวดหมู่',
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('ต่อสู้');
                  },
                  child: Text('แอ็กชัน'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('โรแมนติก');
                  },
                  child: Text('โรแมนติก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('ตลก');
                  },
                  child: Text('ตลก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('แฟนตาซี');
                  },
                  child: Text('แฟนตาซี'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('สยองขวัญ');
                  },
                  child: Text('สยองขวัญ'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // แนะนำ
  Widget _buildRecommendedStories() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แนะนำ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    // Define the desired size for the image container and card
                    final itemWidth = 150.0;
                    final itemHeight = 250.0;

                    return GestureDetector(
                      onTap: () {
                        _RecommendedStories(context, title, imageUrl);
                      },
                      child: Container(
                        width: itemWidth,
                        height: itemHeight,
                        // margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                8.0), // ปรับขนาดมุมของการ์ด
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit
                                  .cover, // ให้รูปภาพปรับขนาดให้พอดีกับการ์ด
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // แอ็กชัน
  Widget _buildAction() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แอ็กชัน',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  // ตรงนี้คุณสามารถระบุการดำเนินการเมื่อปุ่ม "More" ถูกคลิก
                  print('More button clicked');
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    return GestureDetector(
                      onTap: () {
                        _showAction(context, title, imageUrl);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 160,
                                child: Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill, // ให้รูปภาพเต็มกรอบ
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: $title'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//  โรแมนติก
  Widget _buildRomantic() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'โรแมนติก',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  // ตรงนี้คุณสามารถระบุการดำเนินการเมื่อปุ่ม "More" ถูกคลิก
                  print('More button clicked');
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    return GestureDetector(
                      onTap: () {
                        _showAction(context, title, imageUrl);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 160,
                                child: Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill, // ให้รูปภาพเต็มกรอบ
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: $title'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

// คอมเมดี้
  Widget _buildComedy() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'คอมเมดี้',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  // ตรงนี้คุณสามารถระบุการดำเนินการเมื่อปุ่ม "More" ถูกคลิก
                  print('More button clicked');
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    return GestureDetector(
                      onTap: () {
                        _showAction(context, title, imageUrl);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 160,
                                child: Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill, // ให้รูปภาพเต็มกรอบ
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: $title'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // แฟรตาซี
  Widget _buildFantasy() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แฟรตาซี',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  // ตรงนี้คุณสามารถระบุการดำเนินการเมื่อปุ่ม "More" ถูกคลิก
                  print('More button clicked');
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    return GestureDetector(
                      onTap: () {
                        _showAction(context, title, imageUrl);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 160,
                                child: Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill, // ให้รูปภาพเต็มกรอบ
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: $title'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // สยองขวัญ
  Widget _buildHorror() {
    return Container(
      width: 400,
      height: 338,
      color: Color.fromARGB(255, 241, 129, 166),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'สยองขวัญ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  // ตรงนี้คุณสามารถระบุการดำเนินการเมื่อปุ่ม "More" ถูกคลิก
                  print('More button clicked');
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('storys').snapshots(),
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
                    child: Text('ไม่พบข้อมูลในคอลเลกชัน "storys"'),
                  );
                }

                // Return the ListView.builder here
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final title = data['title'];
                    final imageUrl = data['imageUrl'];

                    return GestureDetector(
                      onTap: () {
                        _showAction(context, title, imageUrl);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 160,
                                child: Card(
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill, // ให้รูปภาพเต็มกรอบ
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: $title'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // แอ็กชัน
  void _showAction(BuildContext context, String title, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เรื่องยอดนิยม'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              Text('Title: $title'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Next'),
            )
          ],
        );
      },
    );
  }

  // แนะนำ
  void _RecommendedStories(BuildContext context, title, imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เรื่องยอดนิยม'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              Text('Title: $title'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด AlertDialog
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // ดำเนินการเมื่อปุ่ม "Next" ถูกคลิก
                // คุณสามารถเพิ่มโค้ดที่นี่เพื่อทำงานตามที่คุณต้องการ
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
