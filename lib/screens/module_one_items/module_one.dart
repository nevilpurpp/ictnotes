import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/module_one_items/screens/notes_mod_one.dart';
import 'package:ictnotes/module_one_items/screens/past_papers_mod_one.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../screens/pdf_viewer/pdf_viewer_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class ModuleOne extends StatefulWidget {
  const ModuleOne({Key? key}) : super(key: key);

  @override
  _ModuleOneState createState() => _ModuleOneState();
}

class _ModuleOneState extends State<ModuleOne> {
  late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdAdLoaded = false;

  InterstitialAd? interstitialAd;
  int interstitialAttempt = 0;

  RewardedAd? rewardedAd;
  int rewardedAdAttempt = 0;
  static const AdRequest request = AdRequest(
      //keywords: ['',''],
      //contentUrl: '',
      //nonPersonalizedAds: false
      );
  void loadStaticBannerAd() {
    staticAd = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: 'ca-app-pub-5993939360612746/383524358',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            staticAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('ad failed to load ${error.message}');
        },
      ),
      request: request,
    );
    staticAd.load();
  }

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-5993939360612746/8419373890',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: ((ad) {
          interstitialAd = ad;
          interstitialAttempt = 0;
        }), onAdFailedToLoad: (error) {
          interstitialAttempt++;
          interstitialAd = null;
          if (interstitialAttempt <= maxAttemps) {
            createInterstitialAd();
          }
        }));
  }

  void showInterstistialAd() {
    if (interstitialAd == null) {
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createInterstitialAd();
        });
    interstitialAd!.show();
    interstitialAd = null;
  }

  @override
  void initState() {
    loadStaticBannerAd();
    createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.indigo.shade900,
          backgroundColor: Colors.cyan,
          leading: IconButton(
              onPressed: () {
                showInterstistialAd();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text('MODULE ONE',
              style:
                  GoogleFonts.mochiyPopOne(color: Colors.white, fontSize: 16)),
        ),
        body: Column(
          children: [
            const Expanded(
                flex: -2,
                child: SizedBox(
                  height: 10,
                )),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.cyan.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.cyan.shade800,
                        borderRadius: BorderRadius.circular(50)),
                    tabs: const [
                      Tab(
                        text: 'NOTES',
                      ),
                      Tab(
                        text: 'PASTPAPERS',
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: LayoutBuilder(
                builder: (context, constraints) => const SizedBox(
                  child: TabBarView(
                    children: [
                      NotesModeOne(),
                      ListViewPastPapers()
                      // past_papers
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: staticAd.size.width.toDouble(),
              height: staticAd.size.height.toDouble(),
              child: AdWidget(ad: staticAd),
            ),
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PDFViewerPage(
                file: file,
                url: '',
              )));
}
