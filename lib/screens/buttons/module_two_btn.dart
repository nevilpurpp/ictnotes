import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../module_two_items/module_two.dart';

class ModuleTwoBtn extends StatefulWidget {
  const ModuleTwoBtn({Key? key}) : super(key: key);

  @override
  State<ModuleTwoBtn> createState() => _ModuleTwoBtnState();
}

class _ModuleTwoBtnState extends State<ModuleTwoBtn> {

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
                colors: [Colors.indigo, Colors.cyanAccent]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Image.asset('assets/Books Icon.png')),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Text('MODULE TWO',
                      style: GoogleFonts.mochiyPopOne(
                          color: Colors.white, fontSize: 25)),
                ),
              ),
              const Expanded(
                  child: SizedBox(
                      height: 50,
                      width: 100,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black12,
                      ))),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ModuleTwo()));
        },
      ),
    );
  }
}
