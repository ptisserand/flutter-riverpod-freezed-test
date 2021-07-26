import 'package:flutter/material.dart';

import 'features/jokes/views/jokes_page.dart';

class RiverpodJokesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokesPage(),
    );
  }
}
