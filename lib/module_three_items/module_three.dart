import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/module_three_items/list_view_three/list_view_three.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../api/pdf_api.dart';
import '../pdf_viewer/pdf_viewer_page.dart';

class ModuleThree extends StatefulWidget {
  const ModuleThree({Key? key}) : super(key: key);

  @override
  _ModuleThreeState createState() => _ModuleThreeState();
}

class _ModuleThreeState extends State<ModuleThree> {
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
          elevation: 5,
          shadowColor: Colors.indigo.shade900,
          backgroundColor: Colors.deepPurple[800],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: const Text(
            'MODULE THREE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: -2,
                child: SizedBox(
                  height: 20,
                  child: Text('COMING SOON !!!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo[800])),
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
                              shadowColor: Colors.indigo.shade900,
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('DATA\nCOMMUNICATION',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              const url = '';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                              child: Card(
                                shadowColor: Colors.indigo.shade900,
                                elevation: 5,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/Image 3.png'),
                                    Text('INTERNET BASED\n PROGRAMMING',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.indigo[800]))
                                  ],
                                ),
                              ),
                              onTap: () async {
                                const url = '';
                                final file = await PDFApi.loadFirebase(url);

                                openPDF(context, file);
                              }),
                          GestureDetector(
                            child: Card(
                              shadowColor: Colors.indigo.shade900,
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('MANAGEMENT\n INFORMATION',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              const url = '';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                          GestureDetector(
                            child: Card(
                              shadowColor: Colors.indigo.shade900,
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/Image 3.png'),
                                  Text('PRINCIPLE AND\nPRACTICE MANAGEMENT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.indigo[800]))
                                ],
                              ),
                            ),
                            onTap: () async {
                              const url = '';
                              final file = await PDFApi.loadFirebase(url);

                              openPDF(context, file);
                            },
                          ),
                        ],
                      ),
                      const ListViewThree()
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
