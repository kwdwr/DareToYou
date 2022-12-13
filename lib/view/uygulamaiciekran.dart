import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:daretoyouapp/view/InappView/account_page.dart';
// import 'package:daretoyouapp/view/InappView/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'InappView/home_page.dart';
import 'InappView/settings_page.dart';


class Uygulamaiciekran extends StatefulWidget {
  const Uygulamaiciekran({Key? key}) : super(key: key);

  @override
  State<Uygulamaiciekran> createState() => UygulamaiciekranState();
}
class UygulamaiciekranState extends State<Uygulamaiciekran> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:  [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.cyan));
  }

  @override
  Widget build(BuildContext context) {

    final widgetOptions = [
      const Homepage(),
     // const SearchPage(),
      const AccountPage(),
      const Settingspage(),
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.grey[300],

      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: const Color(0xFFB64355),
        buttonBackgroundColor: const Color(0xFFBFA9E8),
        animationDuration: const Duration(milliseconds: 200),
        color: const Color(0xFF663AB7),
        items: const <Widget>[
          Icon(Icons.home_sharp, size: 30,color: Colors.white),
    //      Icon(Icons.search_sharp, size: 30,color: Colors.white),
          Icon(Icons.person, size: 30,color: Colors.white),
          Icon(Icons.settings, size: 30,color: Colors.white),
        ],
        onTap: _onItemTapped,
      ),
    );

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}