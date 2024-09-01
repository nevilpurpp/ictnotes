import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Discussion extends StatefulWidget {
  Discussion({Key? key}) : super(key: key);



  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
 

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
                child: Image.asset('assets/People Working Together Icon.png'),
              ),
              Expanded(
                flex: 2,
                child: Text('Q/A FORUM',
                    style: GoogleFonts.mochiyPopOne(
                        color: Colors.white, fontSize: 25)),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.black12))),
            ],
          ),
        ),
        onTap: () {
          final snackBar = SnackBar(
            content: const Text(' question and answer forum coming soon !!!'),
            backgroundColor: (Colors.black),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
