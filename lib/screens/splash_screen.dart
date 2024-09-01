import 'dart:async';
import 'package:flutter/material.dart';
import 'Home_ict.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

  

    //Show AppOpen Ad After 8 Seconds
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      //Here we will wait for 8 seconds to load our ad
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeIct(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
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
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.indigo.shade700,
            )
          ],
        ),
      ),
    );
  }
}
