import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/api/pdf_api.dart';
import 'package:ictnotes/module_one_items/list_view_pastpaper/list_view_past_papers.dart';
import 'package:ictnotes/pdf_viewer/pdf_viewer_page.dart';
import 'package:ictnotes/screens/Home_ict.dart';

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
          backgroundColor: Colors.indigo[800],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_outlined)),
          title: Text(
            'MODULE ONE',
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
                color: Colors.indigo[400],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.indigo[800],
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
                                  Text('ICTE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url = '/module one/notes/ICT NOTES-2-1.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/Image 3.png'),
                                    Text('COMPUTER\n APPLICATION',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.indigo[800]))
                                  ],
                                ),
                              ),
                              onTap: () async {
                                showInterstistialAd();
                                const url =
                                    '/module one/notes/Computer Application 1.pdf';
                                final file = await PDFApi.loadFirebase(url);

                                openPDF(context, file);
                              }),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('EEP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url =
                                  '/module one/notes/EE_NOTES(3)[2].pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('COMMUNICATION\nSKILLS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showInterstistialAd();
                              const url =
                                  '/module one/notes/COMM-SKILLS-NOTES.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('OPERATING\n SYSTEM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showRewardedAd();
                              const url =
                                  '/module one/notes/Operating System NOTES.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('STRUCTURED\n PROGRAMMING',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              showRewardedAd();
                              const url =
                                  '/module one/notes/Programming in C.pdf';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                        ],
                      ),
                      const ListViewPastPapers()
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

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}
