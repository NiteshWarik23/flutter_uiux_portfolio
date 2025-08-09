import 'package:flutter/material.dart';

class MobileViewOption1 extends StatelessWidget {
const MobileViewOption1({ Key? key }) : super(key: key);
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: const Text('Mobile View Option 1'),
  ),
  endDrawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // DrawerHeader(
        //   decoration: BoxDecoration(
        //     color: Colors.teal,
        //   ),
        //   child: const Text(
        //     'Menu',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 24,
        //     ),
        //   ),
        // ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            // Handle navigation to home
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () {
            // Handle navigation to about
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'This is the first mobile view option.',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      ElevatedButton(
        onPressed: () {
          // Add your button action here
        },
        child: const Text('Click Me'),
      ),
    ],
  ),


);
}
}