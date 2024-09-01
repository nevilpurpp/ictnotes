import 'dart:io';
import 'package:flutter/material.dart';
import '../../../services/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class ListViewTwo extends StatefulWidget {
  const ListViewTwo({Key? key}) : super(key: key);

  @override
  _ListViewTwoState createState() => _ListViewTwoState();
}

class _ListViewTwoState extends State<ListViewTwo> {
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
                  'VISUAL PROGRAMMING',
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
                        
                        const url = '/module two/pastpapers/VB/';
                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2016 july',
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
                            '/module two/pastpapers/VB/visual programming2016nov.pdf';
                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2016 november',
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
                            '/module two/pastpapers/VB/visual programming2017july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2017 july',
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
                            '/module two/pastpapers/VB/visual programming2017nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2017 november',
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
                            '/module two/pastpapers/VB/visual programming2018july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2018 july',
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
                            '/module two/pastpapers/VB/visual programming2018nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2018 november',
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
                            '/module two/pastpapers/VB/visual programming2019july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2019 july',
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
                  'DATABASE MANAGEMENT ',
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
                            '/module two/pastpaper/DBMS/databasemanagement 2016 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2016 july',
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
                            '/module two/pastpapers/DBMS/databasemanagement 2016 nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2016 november',
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
                            '/module two/pastpapers/DBMS/databasemanagement 2017 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2017 july',
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
                            '/module two/pastpapers/DBMS/databasemanagement 2017 nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2017 NOVEMBER',
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
                            '/module two/pastpapers/DBMS/databasemanagement nov 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2018 november',
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
                            '/module two/pastpapers/DBMS/databasemanagement 2019 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2019 july',
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
                       
                        const url = '/module two/pastpaper/CA/2014nov-Copy.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2014 PRACTICAL',
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
                        
                        const url = '/module two/pastpaper/CA/2015nov-Copy.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2015 PRACTICAL',
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
                            '/module two/pastpaper/CA/CA PRAC 2016 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA 2016 JULY',
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
                        
                        const url = '/module two/pastpaper/CA/CA PRAC 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2016 PRACTICAL',
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
                            '/module two/pastpapers/CA/CA PRAC 2017 JULY.pdf';
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
                       
                        const url = '/module two/pastpaper/CA/CA PRAC 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA PRAC 2017 NOVEMBER',
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
                  'SYSTEM ANALYSIS DESIGN ',
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
                            '/module two/pastpapers/SAD/SAD 2016july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2016 JULY',
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
                            '/module two/pastpapers/SAD/SAD 2016nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2016 NOVEMBER',
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
                            '/module two/pastpapers/SAD/SAD 2017july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2017 JULY',
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
                            '/module two/pastpapers/SAD/SAD 2017nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2017 NOVEMBER',
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
                       
                        const url = '/module two/pastpapers/SAD/SAD 2018j.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2018 JULY',
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
                            '/module two/pastpapers/SAD/SAD 2019july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2019 JULY',
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
                            '/module two/pastpapers/SAD/SAD 2021 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2021 NOVEMBER',
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
                  'QUANTITATIVE METHODS',
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
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2016',
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
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2017 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2017 JULY',
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
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2017 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2017 NOV',
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
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2018 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2018 NOV',
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
                    'OBJECT ORIENTED ',
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
                              '/module two/pastpapers/oop/OOP2014july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP 2014 JULY',
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
                              '/module two/pastpapers/oop/OOP2014nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP 2014 NOVEMBER',
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
                              '/module two/pastpapers/oop/OOP2016july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2016',
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
                              '/module two/pastpapers/oop/OOP2017july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2017',
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
                              '/module two/pastpapers/oop/OOP2017nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP NOVEMBER 2017',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                         
                          const url =
                              '/module two/pastpapers/oop/OOP2018nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP NOVEMBER 2018',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                       
                          const url =
                              '/module two/pastpapers/oop/OOP2019july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2019',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
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
