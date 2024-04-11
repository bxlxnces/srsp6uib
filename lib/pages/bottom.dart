import 'package:dmregister/pages/page3.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'lenta.dart';
import 'package:dmregister/translations/locale_keys.g.dart';

class Bottom extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  Bottom({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Bottom> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _updatePages();
  }

  @override
  void didUpdateWidget(Bottom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.name != oldWidget.name ||
        widget.email != oldWidget.email ||
        widget.country != oldWidget.country) {
      _updatePages();
    }
  }

  void _updatePages() {
    _pages = [
      HomePage(),
      Insta(),
      SecondUser(
        name: widget.name,
        phoneNumber: widget.phoneNumber,
        country: widget.country,
        email: widget.email,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: LocaleKeys.search.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: LocaleKeys.profile.tr(),
          ),
        ],
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class SecondUser extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  SecondUser({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.name.tr()),
            Text('$name', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Text(LocaleKeys.email.tr()),
            Text('$email', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
