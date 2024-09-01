import 'dart:io';

import 'package:flutter/material.dart';


import '../../../services/pdf_api.dart';

import '../../pdf_viewer/pdf_viewer_page.dart';

class NotesModTwo extends StatefulWidget {
  const NotesModTwo({Key? key}) : super(key: key);

  @override
  State<NotesModTwo> createState() => _NotesModTwoState();
}

class _NotesModTwoState extends State<NotesModTwo> {


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
            elevation: 20,
            child: Image.asset(
              'assets/visulb.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            
            const url = '/module two/notes/VB NOTES.pdf';
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
              elevation: 20,
              child: Image.asset(
                'assets/database.png',
                fit: BoxFit.fill,
              ),
            ),
            onTap: () async {
             
              const url = '/module two/notes/dbms_tutorial.pdf';
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
            elevation: 5,
            child: Image.asset(
              'assets/computerapplication.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
          
            const url = '/module one/notes/Programming in C.pdf';
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
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/systemdesign.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
           
            const url = '/module two/notes/SAD notes-1.pdf';
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
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/quantitativeMethods..png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            
            const url = '/module two/notes/Quantitative Methods(Diploma).pdf';
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
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/oop.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            
            const url = '/module two/notes/OOP.pdf';
            final file = await PDFApi.loadFirebase(url);

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
