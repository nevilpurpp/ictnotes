import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black38),
        child: ListView(
          children: [
            Row(
              children: const [
                SizedBox(
                  height: 50,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ICT NOTES AND PAST-PAPERS 😬🥶',
                  style: GoogleFonts.mochiyPopOne(
                      color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Access your 🤕KNEC😢 revision \n materials in one place💻👇👇',
                  style: GoogleFonts.mochiyPopOne(
                      color: Colors.white70, fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }
}
