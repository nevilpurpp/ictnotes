import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import '../../screens/pdf_viewer/pdf_viewer_page.dart';
import '../../services/pdf_api.dart';

class ListViewThree extends StatefulWidget {
  const ListViewThree({Key? key}) : super(key: key);

  @override
  _ListViewThreeState createState() => _ListViewThreeState();
}

class _ListViewThreeState extends State<ListViewThree> {
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
          if (kDebugMode) {
            print('ad failed to load ${error.message}');
          }
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
          if (kDebugMode) {
            print('ad failed to load ${error.message}');
          }
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
          if (kDebugMode) {
            print('ad failed to load ${error.message}');
          }
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
          if (kDebugMode) {
            print('ad failed to load ${error.message}');
          }
          if (rewardedAdAttempt <= maxAttemps) {
            createRewardedAd();
          }
        }));
  }

  void showRewardedAd() {
    if (rewardedAd == null) {
      if (kDebugMode) {
        print('');
      }
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
        if (kDebugMode) {
          print('reward video ${reward.amount}${reward.type}');
        }
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
          if (kDebugMode) {
            print('failed to show ad $ad');
          }
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
    return Scaffold(
        backgroundColor: const Color.fromARGB(246, 2, 21, 35),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'DATA COMMUNICATION',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);

                      openPDF(context, file);
                    },
                    title: const Text(
                      ' COMING SOON',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);

                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '/';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'INTERNET BASED PROGRAMMING',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(
                      'COMING SOON',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                title: const Text(
                  'MANAGEMENT INFORMATION',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset('assets/Image 5.png'),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                children: [
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(
                      'Coming Soon',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: const Text(''),
                  ),
                  ListTile(
                    onTap: () async {
                      const url = '';
                      final file = await PDFApi.loadFirebase(url);
                      openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: const Color.fromARGB(246, 2, 21, 35),
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ExpansionTile(
                  title: const Text(
                    'PRINCIPLE AND PRACTICE MANAGEMENT',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  leading: Image.asset('assets/Image 5.png'),
                  subtitle: const Text(
                    'Past-Papers',
                    style: TextStyle(color: Colors.white38),
                  ),
                  children: [
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'COMING SOON',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(''),
                    ),
                    ListTile(
                      onTap: () async {
                        const url = '';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(''),
                    ),
                  ]),
            ),
          )
        ]));
  }

  void openPDF(
    BuildContext context,
    File file,
  ) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PDFViewerPage(
                file: file,
                url: '',
              )));
}
