import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../../api/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';

class ListViewPastPapers extends StatefulWidget {
  const ListViewPastPapers({Key? key}) : super(key: key);

  @override
  _ListViewPastPapersState createState() => _ListViewPastPapersState();
}

class _ListViewPastPapersState extends State<ListViewPastPapers> {
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
    return Scaffold(
        body: ListView(scrollDirection: Axis.vertical, children: [
      ExpansionTile(
        title: Text(
          'ICTE PAST-PAPERS',
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/Image 5.png'),
        children: [
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/icte/ICTE JULY 2017.pdf';
              final file = await PDFApi.loadFirebase(url);

              openPDF(context, file);
            },
            title: const Text('ICTE JULY 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/icte/ICTE NOVEMBER 2017.pdf';
              final file = await PDFApi.loadFirebase(url);

              openPDF(context, file);
            },
            title: Text('ICTE NOVEMBER 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/icte/ICTE JULY 2018.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: const Text('ICTE JULY 2018'),
          ),
          ListTile(
              onTap: () async {
                showInterstistialAd();
                const url =
                    '/module one/pastpapers/icte/ICTE NOVEMBER 2021.pdf';
                final file = await PDFApi.loadFirebase(url);
                openPDF(context, file);
              },
              title: const Text('ICTE NOVEMBER 2021')),
        ],
      ),
      ExpansionTile(
        title: Text(
          'STRUCTURED PROGRAMMING PAST-PAPERS',
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/Image 5.png'),
        children: [
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/structured programming/SP 2017 JULY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2017 JULY'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/structured programming/SP 2017 NOVEMBER.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2017 NOVEMBER'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/structured programming/STRUCTURED PROGRAMMING JULY 2018.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2018 JULY'),
          ),
          ListTile(
            onTap: () async {
              showRewardedAd();
              const url =
                  '/module one/pastpapers/structured programming/STRUCTURED PROGRAMMING NOV 2016.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2016 NOVEMBER'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/structured programming/SP 2021 JULY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2021 JULY'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/notes/STRUCTURED PROGRAMMING NOV 2021.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('SP 2021 NOVEMBER'),
          ),
        ],
      ),
      ExpansionTile(
        title: Text(
          'COMPUTER APPLICATION PAST-PAPERS',
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/Image 5.png'),
        children: [
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA JULY 2016 THEORY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA JULY 2016 THEORY'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA JULY 2017 PRAC.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA JULY 2017 PRACTICAL'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA NOV 2017 PRAC.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA NOVEMBER 2017 PRACTICAL'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA NOV 2018 THEORY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA NOVEMBER 2018 THEORY'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA JULY 2019 THEORY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA JULY 2019 THEORY'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA JULY 2019 PRAC.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA JULY 2019 PRACTICAL'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/computer application/CA NOV 2021 THEORY.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('CA NOVEMBER 2021 THEORY'),
          ),
        ],
      ),
      ExpansionTile(
        title: Text(
          'MATH PAST-PAPERS',
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/Image 5.png'),
        children: [
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH NOV 2015.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH NOVEMBER 2015'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH NOV 2016.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH NOVEMBER 2016'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH JULY 2017.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH JULY 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH NOV 2017.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH NOVEMBER 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH JULY 2018.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH JULY 2018'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH NOV 2018.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH NOVEMBER 2018'),
          ),
          ListTile(
            onTap: () async {
              showRewardedAd();
              const url = '/module one/notes/Programming in C.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH JULY 2019'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH JULY 2021.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH JULY 2021'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url = '/module one/pastpapers/math/MATH NOV 2021.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('MATH NOVEMBER 2021'),
          ),
        ],
      ),
      ExpansionTile(
        title: Text(
          'OPERATING SYSTEM PAST-PAPERS',
          style: TextStyle(
              color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/Image 5.png'),
        children: [
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS JULY 2017.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS JULY 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS NOV 2017.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS NOVEMBER 2017'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS JULY 2018.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS JULY 2018'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS JULY 2019.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS JULY 2019'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS JULY 2020.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS JULY 2020'),
          ),
          ListTile(
            onTap: () async {
              showInterstistialAd();
              const url =
                  '/module one/pastpapers/operating system/OS JULY 2021.pdf';
              final file = await PDFApi.loadFirebase(url);
              openPDF(context, file);
            },
            title: Text('OS JULY 2021'),
          ),
        ],
      ),
      ExpansionTile(
          title: Text(
            'COMMUNICATION SKILLS PAST-PAPERS',
            style: TextStyle(
                color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
          ),
          leading: Image.asset('assets/Image 5.png'),
          children: [
            ListTile(
              onTap: () async {
                showInterstistialAd();
                const url =
                    '/module one/pastpapers/communication skills/CS JULY 2017.pdf';
                final file = await PDFApi.loadFirebase(url);
                openPDF(context, file);
              },
              title: Text('CS JULY 2017'),
            ),
            ListTile(
              onTap: () async {
                showInterstistialAd();
                const url =
                    '/module one/pastpapers/communication skills/CS NOV 2017.pdf';
                final file = await PDFApi.loadFirebase(url);
                openPDF(context, file);
              },
              title: Text('CS NOVEMBER 2017'),
            ),
            ListTile(
              onTap: () async {
                showInterstistialAd();
                const url =
                    '/module one/pastpapers/communication skills/CS JULY 2018.pdf';
                final file = await PDFApi.loadFirebase(url);
                openPDF(context, file);
              },
              title: Text('CS JULY 2018'),
            ),
          ])
    ]));
  }

  void openPDF(
    BuildContext context,
    File file,
  ) =>
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
}
