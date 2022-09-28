import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.deepPurple, Colors.blue]),
            ), //BoxDecoration
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.deepPurple, Colors.indigoAccent]),
                ), //BoxDecoration
                accountName: const Text(
                  "NIVR Inc.",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text("nevilpurpp12@gmail.com"),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: CircleAvatar(
                    child: Image.asset(
                  'assets/nivr trans.png',
                  fit: BoxFit.fill,
                )), //circleAvatar
              ),
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
            applicationVersion: '2.9',
            applicationLegalese: '© Copyright NIVR Inc 2022 Company',
            child: const Text(
              'About App',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),

          ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: Icon(
              Icons.more_outlined,
              color: Colors.green[800],
              size: 40,
            ),
            title: const Text(
              'More Apps',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              moreApps();
            },
          ),
          Divider(),
          ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: Icon(
              Icons.facebook_outlined,
              color: Colors.blue[800],
              size: 40,
            ),
            title: const Text(
              'LIKE US ON FACEBOOK',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              facebook();
            },
          ),
          const Divider(),
          /* ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: Icon(
              Icons.mail,
              color: Colors.cyan[800],
              size: 40,
            ),
            title: const Text(
              'SEND US YOUR FEEDBACK',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              feedback();
            },
          ),*/
          const Divider(),
          ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: Icon(
              Icons.close_outlined,
              color: Colors.red[800],
              size: 40,
            ),
            title: const Text(
              'exit',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}

moreApps() async {
  var url = Uri.parse(
      "https://play.google.com/store/apps/dev?id=7402327802723795267");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

facebook() async {
  var url = Uri.parse("https://web.facebook.com/lazy.corder.3");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

feedback() async {
  var url = Uri.parse("https://mail.google.com/mail/u/0/#inbox");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
