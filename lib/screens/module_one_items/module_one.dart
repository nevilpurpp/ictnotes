import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ictnotes/screens/module_one_items/screens/notes_mod_one.dart';
import 'package:ictnotes/screens/module_one_items/screens/past_papers_mod_one.dart';

import '../pdf_viewer/pdf_viewer_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class ModuleOne extends StatefulWidget {
  const ModuleOne({Key? key}) : super(key: key);

  @override
  _ModuleOneState createState() => _ModuleOneState();
}

class _ModuleOneState extends State<ModuleOne> {
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.indigo.shade900,
          backgroundColor: Colors.cyan,
          leading: IconButton(
              onPressed: () {
                
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text('MODULE ONE',
              style:
                  GoogleFonts.mochiyPopOne(color: Colors.white, fontSize: 16)),
        ),
        body: Column(
          children: [
            const Expanded(
                flex: -2,
                child: SizedBox(
                  height: 10,
                )),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.cyan.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.cyan.shade800,
                        borderRadius: BorderRadius.circular(50)),
                    tabs: const [
                      Tab(
                        text: 'NOTES',
                      ),
                      Tab(
                        text: 'PASTPAPERS',
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: LayoutBuilder(
                builder: (context, constraints) => const SizedBox(
                  child: TabBarView(
                    children: [
                      NotesModeOne(),
                      ListViewPastPapers()
                      // past_papers
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PDFViewerPage(
                file: file,
                url: '',
              )));
}
