import 'package:flutter/material.dart';

class DiscussionHome extends StatefulWidget {
  const DiscussionHome({Key? key}) : super(key: key);

  @override
  State<DiscussionHome> createState() => _DiscussionHomeState();
}

class _DiscussionHomeState extends State<DiscussionHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiscussionHome'),
      ),
    );
  }
}
