import 'package:flutter/material.dart';
import 'package:phone/ui/tabs/contact.dart';
import 'package:phone/ui/tabs/favourite.dart';
import 'package:phone/ui/tabs/recent.dart';

///
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 24.0,
            margin: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            // color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 12.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Search contacts',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => showSearch(
                            context: context,
                            delegate: ContactSearch(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    child: Icon(Icons.mic_none, color: Colors.black38),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: PopupMenuButton<String>(
                    color: Colors.black,
                    onSelected: choiceAction,
                    itemBuilder: (context) {
                      return ActionItems.choices.map((String value) {
                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.star_border),
            ),
            Tab(
              icon: Icon(Icons.access_time),
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Favourite(),
          Recent(),
          ContactListPage(),
        ],
      ),
    );
  }

  void choiceAction(String value) {}
}

///
class ContactSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print(query);
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class ActionItems {
  static const String newGroup = 'New group';
  static const String newBroadcast = 'New broadcast';
  static const String whatsAppWeb = 'WhatsApp Web';
  static const String starredMessages = 'Starred messages';
  static const String settings = 'Settings';

  static const List<String> choices = <String>[
    newGroup,
    newBroadcast,
    whatsAppWeb,
    starredMessages,
    settings
  ];
}
