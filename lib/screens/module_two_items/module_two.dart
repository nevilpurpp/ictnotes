import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import '../screens/pdf_viewer/pdf_viewer_page.dart';
import 'screens/notes_mod_two.dart';
import 'screens/past_papers_two.dart';
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
          if (kDebugMode) {
            print('failed to show ad $ad');
          }
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
      if (kDebugMode) {
        print('');
      }
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.indigo.shade900,
          elevation: 5,
          backgroundColor: Colors.indigo.shade900,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
          title: Text(
            'MODULE TWO',
            style: GoogleFonts.mochiyPopOne(color: Colors.white, fontSize: 18),
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
                color: Colors.indigo.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.indigo.shade900,
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
                      NotesModTwo(),
                      ListViewTwo()
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
