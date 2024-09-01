import 'package:flutter/material.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key}) : super(key: key);

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      appBar: AppBar(
        title: const Text('DISCUSSION FORUM'),
        backgroundColor: const Color.fromARGB(246, 2, 21, 35),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'COMING SOON!!!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
