import 'package:flutter/material.dart';


class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  bool isDark = false;
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to My App! mitr Search',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

 