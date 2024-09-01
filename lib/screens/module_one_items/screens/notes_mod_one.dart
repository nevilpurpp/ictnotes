import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../services/pdf_api.dart';
import '../../Home_ict.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class NotesModeOne extends StatefulWidget {
  const NotesModeOne({Key? key}) : super(key: key);

  @override
  State<NotesModeOne> createState() => _NotesModeOneState();
}

class _NotesModeOneState extends State<NotesModeOne> {
 

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 100,
            child: Center(
                child: Image.asset(
              'assets/icte.png',
              fit: BoxFit.fill,
            )),
          ),
          onTap: () async {
            
            const CircularProgressIndicator();
            const url = '/module one/notes/ICT NOTES-2-1.pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.black,
              elevation: 100,
              child: Image.asset(
                'assets/computerapplication.png',
                fit: BoxFit.fill,
              ),
            ),
            onTap: () async {
              
              const CircularProgressIndicator();
              const url = '/module one/notes/Computer Application 1.pdf';
              final file = await PDFApi.loadFirebase(url);

              openPDF(context, file);
            }),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 100,
            child: Image.asset(
              'assets/eep.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
           
            const CircularProgressIndicator();
            const url = '/module one/notes/EE_NOTES(3)[2].pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 100,
            child: Image.asset(
              'assets/commskills.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
           
            const url = '/module one/notes/COMM-SKILLS-NOTES.pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 100,
            child: Image.asset(
              'assets/os.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            
            const CircularProgressIndicator();
            const url = '/module one/notes/Operating System NOTES.pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 20,
            child: Center(
              child: Image.asset(
                'assets/sp.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () async {
            
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );

            const url = '/module one/notes/ICT NOTES-2-1.pdf';
            final file = await compute(PDFApi.loadFirebase, url);

            Navigator.of(context).pop(); // Dismiss the progress dialog

            openPDF(context, file);
          },
        ),
      ],
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void openPDF(
    BuildContext context,
    File file,
  ) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PDFViewerPage(
                file: file,
                url: '',
              )));
}
