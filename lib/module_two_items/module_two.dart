import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../api/pdf_api.dart';
import '../pdf_viewer/pdf_viewer_page.dart';
import 'list_view_two/list_view_two.dart';
import 'package:ictnotes/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ModuleTwo extends StatefulWidget {
  const ModuleTwo({Key? key}) : super(key: key);

  @override
  _ModuleTwoState createState() => _ModuleTwoState();
}

class _ModuleTwoState extends State<ModuleTwo> {
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
      size: AdSize.banner,
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

  void loadinlineBannerAd() {
    inlineAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-5993939360612746/383524358',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            inlineAdAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('ad failed to load ${error.message}');
        },
      ),
      request: request,
    );
    inlineAd.load();
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
          print('ad failed to load ${error.message}');
          if (interstitialAttempt <= maxAttemps) {
            createInterstitialAd();
          }
        }));
  }

  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-5993939360612746/3315335302',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: ((ad) {
          rewardedAd = ad;
          rewardedAdAttempt = 0;
        }), onAdFailedToLoad: (error) {
          rewardedAdAttempt++;
          rewardedAd = null;
          print('ad failed to load ${error.message}');
          if (rewardedAdAttempt <= maxAttemps) {
            createRewardedAd();
          }
        }));
  }

  void showRewardedAd() {
    if (rewardedAd == null) {
      print('');
      return;
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('failed to show ad $ad');
          createRewardedAd();
        });
    rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        print('reward video ${reward.amount}${reward.type}');
      },
    );
    rewardedAd = null;
  }

  void showInterstistialAd() {
    if (interstitialAd == null) {
      print('');
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
          print('failed to show ad $ad');
          createInterstitialAd();
        });
    interstitialAd!.show();
    interstitialAd = null;
  }

  @override
  void initState() {
    loadStaticBannerAd();
    loadinlineBannerAd();
    createInterstitialAd();
    createRewardedAd();
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
          backgroundColor: Colors.deepPurple[800],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: const Text(
            'MODULE TWO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
                color: Colors.deepPurple[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.deepPurple[800],
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
                builder: (context, constraints) => SizedBox(
                  child: TabBarView(
                    children: [
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        children: [
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('VISUAL\n BASIC',
                                      style: TextStyle(
                                          color: Colors.indigo[800],
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url = '/module two/notes/VB NOTES.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/Image 3.png'),
                                    Text('DATABASE\n MANAGEMENT',
                                        style: TextStyle(
                                            color: Colors.indigo[800],
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              onTap: () async {
                                showRewardedAd();
                                const url =
                                    '/module two/notes/dbms_tutorial.pdf';
                                final file = await PDFApi.loadFirebase(url);

                                openPDF(context, file);
                              }),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('COMPUTER\n APPLICATION',
                                      style: TextStyle(
                                          color: Colors.indigo[800],
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url =
                                  '/module one/notes/Programming in C.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('SYSTEM\nDESIGN',
                                      style: TextStyle(
                                          color: Colors.indigo[800],
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url = '/module two/notes/SAD notes-1.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('QUANTITATIVE\n METHODS',
                                      style: TextStyle(
                                          color: Colors.indigo[800],
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showRewardedAd();
                              const url =
                                  '/module two/notes/Quantitative Methods(Diploma).pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('OBJECT\n ORIENTED\n PROGRAMMING',
                                      style: TextStyle(
                                          color: Colors.indigo[800],
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showRewardedAd();
                              const url = '/module two/notes/OOP.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                        ],
                      ),
                      const ListViewTwo()
                      // past_papers
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: inlineAd.size.width.toDouble(),
              height: inlineAd.size.height.toDouble(),
              child: AdWidget(ad: inlineAd),
            ),
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}
