import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[800],
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo[800]),
                accountName: const Text(
                  "NEVI STUDIOS",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("nevilpurpp12@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader

            AboutListTile(
              icon: Icon(
                Icons.info,
                color: Colors.lightBlueAccent.shade700,
                size: 40,
              ),
              applicationIcon: Icon(
                Icons.info_outline,
                color: Colors.pink[800],
              ),
              applicationName: 'ICT NOTES AND PAST-PAPERS',
              applicationVersion: '2.6.1',
              applicationLegalese: '2022 Company',
              child: const Text(
                'About App',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),

            ListTile(
              leading: Icon(
                Icons.more_outlined,
                color: Colors.green[800],
                size: 40,
              ),
              title: const Text(
                'More Apps',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.close_outlined,
                color: Colors.red[800],
                size: 40,
              ),
              title: const Text(
                'exit',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
