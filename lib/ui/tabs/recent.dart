import 'package:flutter/material.dart';

///
class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Recent'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.dialpad),
        onPressed: () {},
      ),
    );
  }
}
