import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:no_internet_check/internet_connectivity/initialize_internet_checker.dart';
import '../utils/connection_util.dart';
import 'bottomnavScreens/discussion_home.dart';
import 'bottomnavScreens/notes_page.dart';
import 'bottomnavScreens/past_paper_page.dart';
import 'bottomnavScreens/profile_page.dart';

const int maxAttemps = 3;
bool hasInterNetConnection = false;

class HomeIct extends StatefulWidget {
  const HomeIct({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeIctState createState() => _HomeIctState();
}

class _HomeIctState extends State<HomeIct> with WidgetsBindingObserver {
 

  @override
  void initState() {
  
    InternetChecker();
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    connectionStatus.initialize();
    connectionStatus.connectionChange.listen(connectionChanged);
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      hasInterNetConnection = hasConnection;
    });
  }

  final _pageViewController = PageController();

  List<IconData> iconList = [
    Icons.book,
    Icons.import_contacts_rounded,
    Icons.chat,
    Icons.account_circle_rounded
  ];
  late int _bottomNavIndex = 0;
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: hasInterNetConnection
            ? WillPopScope(
                onWillPop: showExitPopup,
                child: Scaffold(
                    backgroundColor: const Color.fromARGB(246, 2, 21, 35),
                    bottomNavigationBar: AnimatedBottomNavigationBar(
                      notchSmoothness: NotchSmoothness.verySmoothEdge,
                      notchMargin: 0.0,
                      backgroundColor: const Color.fromARGB(246, 4, 34, 55),
                      gapLocation: GapLocation.none,
                      iconSize: 30,
                      leftCornerRadius: 32,
                      splashSpeedInMilliseconds: 1000,
                      splashColor: Colors.indigo.shade200,
                      splashRadius: 30,
                      rightCornerRadius: 32,
                      activeColor: Colors.indigo.shade700,
                      inactiveColor: Colors.indigo.shade300,
                      icons: iconList,
                      activeIndex: _bottomNavIndex,
                      onTap: (index) {
                        _pageViewController.animateToPage(index,
                            duration: const Duration(milliseconds: 20),
                            curve: Curves.bounceOut);
                      },
                    ),
                    body: PageView(
                      controller: _pageViewController,
                      children: const [
                        NotesPage(),
                        PastPaperPage(),
                        DiscussionPage(),
                        ProfilePage()
                      ],
                      onPageChanged: (index) {
                        setState(() {
                          _bottomNavIndex = index;
                        });
                      },
                    )),
              )
            : const Center(
                child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Requires An Internet Connection',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                  ),
                ],
              )));
  }
}
