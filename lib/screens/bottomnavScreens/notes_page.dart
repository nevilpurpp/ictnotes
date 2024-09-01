
import 'package:flutter/material.dart';
import '../drawer_/drawer_screen.dart';
import '../module_one_items/screens/notes_mod_one.dart';
import '../module_three_items/screens/notes_mod_three.dart';
import '../module_two_items/screens/notes_mod_two.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('NOTES'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(246, 2, 21, 35),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: const Icon(
                  Icons.notes_rounded,
                  size: 40,
                ));
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Container(
              height: 200,
              width: 150,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(246, 2, 21, 35),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(10, 10),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-10, -10),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ]),
              child: Column(
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
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Module one',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 150,
            child: NotesModeOne(),
          ),
          const SizedBox(
            height: 50,
          ),
         
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Module two',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 150,
            child: NotesModTwo(),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Module Three',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 150,
            child: NotesModThree(),
          ),
        ],
      ),
    );
  }
}
