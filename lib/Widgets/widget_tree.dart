import 'package:flutter/material.dart';
import 'package:skin_analyzed_project/home.dart';
import 'package:skin_analyzed_project/profile.dart';
import 'package:skin_analyzed_project/scan.dart';
import 'package:skin_analyzed_project/skin-result.dart';

class WidgetTree extends StatefulWidget {
  final String username;
  final String id;

  const WidgetTree({Key? key, required this.username, required this.id})
      : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Home(
        username: widget.username,
        id: widget.id,
      ), // Add the Profile widget here
      ScanFace(),
      Profile(),
    ];

    return Scaffold(
      body: pages.elementAt(currentPage),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.camera_enhance), label: ''),
          NavigationDestination(
              icon: Icon(Icons.account_circle_rounded), label: ''),
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
