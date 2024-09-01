import 'package:flutter/material.dart';
import '../module_one_items/screens/past_papers_mod_one.dart';
import '../module_three_items/screens/past_papers_mod_three.dart';
import '../module_two_items/screens/past_papers_two.dart';

class PastPaperPage extends StatefulWidget {
  const PastPaperPage({Key? key}) : super(key: key);

  @override
  State<PastPaperPage> createState() => _PastPaperPageState();
}

class _PastPaperPageState extends State<PastPaperPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(246, 2, 21, 35),
            title: const Text(
              'Past-Papers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: const Color.fromARGB(246, 2, 21, 35),
          body: Column(children: [
            TabBar(
                indicator: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                tabs: const [
                  Tab(
                    text: 'Module One',
                  ),
                  Tab(
                    text: 'Module Two',
                  ),
                  Tab(
                    text: 'Module Three',
                  )
                ]),
            Expanded(
              flex: 2,
              child: LayoutBuilder(
                builder: (context, constraints) => const SizedBox(
                  child: TabBarView(
                    children: [
                      ListViewPastPapers(),
                      ListViewTwo(),
                      ListViewThree(),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
