
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pdf_viewer/pdf_viewer_page.dart';
import 'screens/notes_mod_two.dart';
import 'screens/past_papers_two.dart';

class ModuleTwo extends StatefulWidget {
  const ModuleTwo({Key? key}) : super(key: key);

  @override
  _ModuleTwoState createState() => _ModuleTwoState();
}

class _ModuleTwoState extends State<ModuleTwo> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.indigo.shade900,
          elevation: 5,
          backgroundColor: Colors.indigo.shade900,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text(
            'MODULE TWO',
            style: GoogleFonts.mochiyPopOne(color: Colors.white, fontSize: 18),
          ),
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
                color: Colors.indigo.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.indigo.shade900,
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
                      NotesModTwo(),
                      ListViewTwo()
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
