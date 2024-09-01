import 'dart:io';

import 'package:flutter/material.dart';

import '../../../services/pdf_api.dart';
import '../../Home_ict.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class NotesModThree extends StatefulWidget {
  const NotesModThree({Key? key}) : super(key: key);

  @override
  State<NotesModThree> createState() => _NotesModThreeState();
}

class _NotesModThreeState extends State<NotesModThree> {


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
              'assets/datacomms.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
          
            const url = '';
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
                'assets/InternetBased.png',
                fit: BoxFit.fill,
              ),
            ),
            onTap: () async {
          
              const url = '';
              final file = await PDFApi.loadFirebase(url);

              openPDF(context, file);
            }),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/ManagementInformation.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
           
            const url = '';
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
              'assets/principle.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            /*showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                );
              },
            );*/
            const url = '';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
      ],
    );
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
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
