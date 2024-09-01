import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ictnotes/screens/module_three_items/screens/notes_mod_three.dart';
import 'package:ictnotes/screens/module_three_items/screens/past_papers_mod_three.dart';

import '../pdf_viewer/pdf_viewer_page.dart';



class ModuleThree extends StatefulWidget {
  const ModuleThree({Key? key}) : super(key: key);

  @override
  _ModuleThreeState createState() => _ModuleThreeState();
}

class _ModuleThreeState extends State<ModuleThree> {
 

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
          backgroundColor: Colors.deepPurple[800],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text(
            'MODULE THREE',
            style: GoogleFonts.mochiyPopOne(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: -2,
                child: SizedBox(
                  height: 20,
                  child: Text('COMING SOON !!!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo[800])),
                )),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.deepPurple[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.deepPurple[800],
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
                      NotesModThree(),
                      ListViewThree()
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
