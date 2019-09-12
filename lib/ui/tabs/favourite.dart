import 'package:flutter/material.dart';

///
class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favourite'),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: FloatingActionButton(
              child: Icon(Icons.dialpad),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
