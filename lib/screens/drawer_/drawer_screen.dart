import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.indigo, Colors.cyan]),
            ), //BoxDecoration
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.cyan, Colors.indigoAccent]),
                ), //BoxDecoration
                accountName: Text(
                  "NIVR Inc.",
                  style: GoogleFonts.mochiyPopOne(
                      color: Colors.white, fontSize: 16),
                ),
                accountEmail: Text("nevilpurpp12@gmail.com",
                    style: GoogleFonts.mochiyPopOne(
                        color: Colors.white, fontSize: 14)),
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
            icon: const Icon(
              Icons.info,
              color: Colors.cyan,
              size: 40,
            ),
            applicationIcon: Icon(
              Icons.info_outline,
              color: Colors.pink[800],
            ),
            applicationName: 'ICT NOTES AND PAST-PAPERS',
            applicationVersion: '2.9',
            applicationLegalese: '© Copyright NIVR Inc 2022 Company',
            child: Text(
              'About App',
              style: GoogleFonts.mochiyPopOne(
                  color: Colors.cyan.shade900, fontSize: 15),
            ),
          ),
          const Divider(),

          ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: const Icon(
              Icons.more_outlined,
              color: Colors.cyan,
              size: 40,
            ),
            title: Text(
              'More Apps',
              style: GoogleFonts.mochiyPopOne(
                  color: Colors.cyan.shade900, fontSize: 15),
            ),
            onTap: () {
              moreApps();
            },
          ),
          const Divider(),
          ListTile(
            hoverColor: Colors.deepPurpleAccent,
            leading: const Icon(
              Icons.facebook_outlined,
              color: Colors.cyan,
              size: 40,
            ),
            title: Text(
              'LIKE US ON FACEBOOK',
              style: GoogleFonts.mochiyPopOne(
                  color: Colors.cyan.shade900, fontSize: 12),
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
            leading: const Icon(
              Icons.close_outlined,
              color: Colors.cyan,
              size: 40,
            ),
            title: Text(
              'exit',
              style: GoogleFonts.mochiyPopOne(
                  color: Colors.cyan.shade900, fontSize: 15),
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
            child: Text(
              '© Copyright NIVR Inc 2022 Company',
              style: GoogleFonts.mochiyPopOne(
                  color: Colors.cyan.shade900, fontSize: 12),
            ),
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
