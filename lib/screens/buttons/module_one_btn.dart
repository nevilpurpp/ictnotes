import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../module_one_items/module_one.dart';

class ModuleOneBtn extends StatefulWidget {
  const ModuleOneBtn({Key? key}) : super(key: key);

  @override
  State<ModuleOneBtn> createState() => _ModuleOneBtnState();
}

class _ModuleOneBtnState extends State<ModuleOneBtn> {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyanAccent, Colors.indigo]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset('assets/Books Icon.png'),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Text('MODULE ONE',
                      style: GoogleFonts.mochiyPopOne(
                          color: Colors.white, fontSize: 25)),
                ),
              ),
              const Expanded(
                  child: SizedBox(
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.black12))),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ModuleOne()));
        },
      ),
    );
  }
}
