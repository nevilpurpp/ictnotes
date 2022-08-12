import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../../api/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';
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
    return Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ExpansionTile(title: const Text('DATA COMMUNICATION'),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(onTap: () async {
                    const url = '';
                    final file = await PDFApi.loadFirebase(url);


                    openPDF(context, file);
                  },
                    title: const Text('COMING SOON'),),
                  ListTile(onTap: () async {
                    const url = '';
                    final file = await PDFApi.loadFirebase(url);


                    openPDF(context, file);
                  },
                    title: Text(''),
                  ),
                  ListTile(onTap: ()async {
                    const url = '/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                  },
                    title: const Text(''),
                  ),
                   Container(
              alignment: Alignment.bottomCenter,
              width: staticAd.size.width.toDouble(),
              height: staticAd.size.height.toDouble(),
              child: AdWidget(ad: staticAd),
            ),

                  ListTile(onTap: () async{const url = '';
                  final file = await PDFApi.loadFirebase(url);
                  openPDF(context, file);
                  },
                    title: const Text(''),
                  ),

                ],
              ),

              ExpansionTile(title: Text('INTERNET BASED PROGRAMMING'),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('COMING SOON'),
                  ),
                  ListTile(
                    onTap: () async{const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],),
              ExpansionTile(title: Text('MANAGEMENT INFORMATION'),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = 'COMING SOON';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),


                ],),
              ExpansionTile(title: const Text('PRINCIPLE AND PRACTICE MANAGEMENT'),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('COMING SOON'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),]

    )

            ]
        )
    );



  }

  void openPDF(BuildContext context, File file,) =>
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));


}
