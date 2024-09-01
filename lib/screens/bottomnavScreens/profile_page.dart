import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ictnotes/models/user_model.dart';
import '../../services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name = '';
  String? email = '';
  //String? image ='';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['displayName'];
          email = snapshot.data()!['email'];
          //image = snapshot.data()!['userImage'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(246, 2, 21, 35),
        title: const Text(
          'PROFILE',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              child: Image.network(''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: const Color.fromARGB(246, 2, 21, 35),
                child: Center(
                    child: Text(
                  name as String,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: const Color.fromARGB(246, 2, 21, 35),
                child: Center(
                  child: Text(
                    email as String,
                    style: TextStyle(
                        color: Colors.indigo.shade200,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: const Card(
                child: Text('Coming soon'),
              ),
              onTap: () {
                //FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
