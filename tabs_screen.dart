import 'package:deep_pocket/models/mock_data.dart';
import 'package:deep_pocket/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'profile_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [
    {
      'Title': 'Feed',
      'Body': feedScreen(),
    },
    {
      'Title': 'Profile',
      'Body': profileScreen(),
    }
  ];
  int _selectedindex = 0;
  void _selectedpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => mockData(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(pages[_selectedindex]['Title'].toString()),
        // ),
        drawer: Drawer(
            // Populate the Drawer in the next step.
            ),
        body: pages[_selectedindex]['Body'] as Widget,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.blue,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blue,
          items: const <Widget>[
            Icon(Icons.category, color: Colors.white, size: 30),
            Icon(Icons.person, color: Colors.white, size: 30),
            // Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            return _selectedpage(index);
          },
        ),
      ),
    );
  }
}
