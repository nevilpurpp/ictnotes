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
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Center(
            child: Icon(Icons.import_contacts_outlined,
                size: 100, color: Colors.indigo.shade200),
          ),
          const Center(
            child: Text(
              'ICT NOTES AND\n PAST-PAPERS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.indigo),
            ),
          ),
          AboutListTile(
            icon: const Icon(
              Icons.info,
              color: Colors.indigo,
              size: 40,
            ),
            applicationIcon: Icon(
              Icons.info_outline,
              color: Colors.pink[800],
            ),
            applicationName: 'ICT NOTES AND PAST-PAPERS',
            applicationVersion: '3.3',
            applicationLegalese: '© Copyright FlutterWars Inc 2022 Company',
            child: Text(
              'About App',
              style: TextStyle(
                color: Colors.indigo.shade200,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.more_outlined,
              color: Colors.indigo,
              size: 40,
            ),
            title: Text('More Apps',
                style: TextStyle(
                  color: Colors.indigo.shade200,
                )),
            onTap: () {
              moreApps();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.facebook_outlined,
              color: Colors.blue,
              size: 40,
            ),
            title: Text(
              'LIKE US ON FACEBOOK',
              style: TextStyle(
                color: Colors.indigo.shade200,
              ),
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
            leading: const Icon(
              Icons.close_outlined,
              color: Colors.indigo,
              size: 40,
            ),
            title: Text(
              'exit',
              style: TextStyle(
                color: Colors.indigo.shade200,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          const SizedBox(
            height: 270,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('© Copyright FlutterWars, Inc 2022 Company',
                style: TextStyle(
                  color: Colors.indigo.shade200,
                )),
          ),
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
