import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer and Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Page> _pages = [
    Page('Home', Icons.home),
    Page('Feedback', Icons.feedback),
    Page('Profile', Icons.person_outline),
  ];


  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItemWidgets = widget._pages
        .asMap()
        .map((int index, Page page) =>
        MapEntry<int, Widget>(index,
            ListTile(
              title: Text(page.title),
              leading: Icon(page.iconData),
              selected: _currentPageIndex == index,
              onTap: () {
                _openPage(index);
                Navigator.pop(context);
              },
            )
        )
    ).values.toList();
    drawerItemWidgets.insert(0, DrawerHeader(
      child: Text('Drawer Header'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ),);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar and Drawer Page"),
      ),
      body: Center(
        child: Text(widget._pages[_currentPageIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerItemWidgets,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: widget._pages.map((Page page) =>
            BottomNavigationBarItem(
              icon: Icon(page.iconData),
              label: page.title,
            )).toList(),
        onTap: _openPage,
      ),);
  }
}

class Page {
  final String title;
  final IconData iconData;
  Page(this.title, this.iconData);
}
