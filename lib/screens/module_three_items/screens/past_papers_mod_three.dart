import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class ListViewThree extends StatefulWidget {
  const ListViewThree({Key? key}) : super(key: key);

  @override
  _ListViewThreeState createState() => _ListViewThreeState();
}

class _ListViewThreeState extends State<ListViewThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(246, 2, 21, 35),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'DATA COMMUNICATION',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);

                      openPDF(context, file);
                    },
                    title: const Text(
                      ' COMING SOON',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);

                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '/';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'INTERNET BASED PROGRAMMING',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(
                      'COMING SOON',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'MANAGEMENT INFORMATION',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(
                      'Coming Soon',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                  title: const Text(
                    'PRINCIPLE AND PRACTICE MANAGEMENT',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  leading: Image.asset('assets/Image 5.png'),
                  subtitle: const Text(
                    'Past-Papers',
                    style: TextStyle(color: Colors.white38),
                  ),
                  children: [
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'COMING SOON',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(''),
                    ),
                  ]),
            ),
          )
        ]));
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
