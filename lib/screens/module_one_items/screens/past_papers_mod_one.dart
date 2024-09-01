import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import '../../../services/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class ListViewPastPapers extends StatefulWidget {
  const ListViewPastPapers({Key? key}) : super(key: key);

  @override
  _ListViewPastPapersState createState() => _ListViewPastPapersState();
}

class _ListViewPastPapersState extends State<ListViewPastPapers> {
 

  bool isLoading = false;
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
                  'ICTE',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/icte/ICTE JULY 2017.pdf';

                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text(
                        'ICTE JULY 2017',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/icte/ICTE NOVEMBER 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text('ICTE NOVEMBER 2017',
                          style: TextStyle(color: Colors.white70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/icte/ICTE JULY 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'ICTE JULY 2018',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          
                          const url =
                              '/module one/pastpapers/icte/ICTE NOVEMBER 2021.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'ICTE NOVEMBER 2021',
                          style: TextStyle(color: Colors.white70),
                        )),
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
                  'STRUCTURED PROGRAMMING',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/structured programming/SP 2017 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2017 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/structured programming/SP 2017 NOVEMBER.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2017 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/structured programming/STRUCTURED PROGRAMMING JULY 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2018 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/structured programming/STRUCTURED PROGRAMMING NOV 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2016 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/structured programming/SP 2021 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2021 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                     
                        const url =
                            '/module one/notes/STRUCTURED PROGRAMMING NOV 2021.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SP 2021 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'COMPUTER APPLICATION ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/computer application/CA JULY 2016 THEORY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA JULY 2016 THEORY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/computer application/CA JULY 2017 PRAC.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA JULY 2017 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/computer application/CA NOV 2017 PRAC.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2017 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/computer application/CA NOV 2018 THEORY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2018 THEORY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/computer application/CA JULY 2019 THEORY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA JULY 2019 THEORY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                    
                        const url =
                            '/module one/pastpapers/computer application/CA JULY 2019 PRAC.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA JULY 2019 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/computer application/CA NOV 2021 THEORY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2021 THEORY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'COMPUTATIONAL MATHEMATICS',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        const url =
                            '/module one/pastpapers/math/MATH NOV 2015.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH NOVEMBER 2015',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH NOV 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH NOVEMBER 2016',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH JULY 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH JULY 2017',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH NOV 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH NOVEMBER 2017',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                     
                        const url =
                            '/module one/pastpapers/math/MATH JULY 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH JULY 2018',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH NOV 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH NOVEMBER 2018',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/math/MATH JULY 2019.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH JULY 2019',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH JULY 2021.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH JULY 2021',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/math/MATH NOV 2021.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'MATH NOVEMBER 2021',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'OPERATING SYSTEM ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/operating system/OS JULY 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS JULY 2017',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                      
                        const url =
                            '/module one/pastpapers/operating system/OS NOV 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS NOVEMBER 2017',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                       
                        const url =
                            '/module one/pastpapers/operating system/OS JULY 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS JULY 2018',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/operating system/OS JULY 2019.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS JULY 2019',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/operating system/OS JULY 2020.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS JULY 2020',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        
                        const url =
                            '/module one/pastpapers/operating system/OS JULY 2021.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'OS JULY 2021',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                    'COMMUNICATION SKILLS ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Past-Papers',
                    style: TextStyle(color: Colors.white38),
                  ),
                  leading: Image.asset('assets/Image 5.png'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          
                          const url =
                              '/module one/pastpapers/communication skills/CS JULY 2017.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'CS JULY 2017',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          
                          const url =
                              '/module one/pastpapers/communication skills/CS NOV 2017.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'CS NOVEMBER 2017',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          
                          const url =
                              '/module one/pastpapers/communication skills/CS JULY 2018.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'CS JULY 2018',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        
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
