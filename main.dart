import 'package:deep_pocket/models/mock_data.dart';
import 'package:deep_pocket/screens/feed_screen.dart';
import 'package:deep_pocket/widgets/user_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => mockData(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TabsScreen(),
          routes: {
            userInput.route: (ctx) => userInput(),
          }),
    );
  }
}
