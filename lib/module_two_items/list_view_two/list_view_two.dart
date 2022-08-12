import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/screens/Home_ict.dart';

import '../../api/pdf_api.dart';
import '../../pdf_viewer/pdf_viewer_page.dart';
class ListViewTwo extends StatefulWidget {
  const ListViewTwo({Key? key}) : super(key: key);

  @override
  _ListViewTwoState createState() => _ListViewTwoState();
}

class _ListViewTwoState extends State<ListViewTwo> {
  @override
  Widget build(BuildContext context) {
    late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdAdLoaded = false;

  InterstitialAd? interstitialAd;
  int interstitialAttempt = 0;

  RewardedAd? rewardedAd;
  int rewardedAdAttempt = 0;
   const AdRequest request = AdRequest(
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
    return Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ExpansionTile(title:  Text('VISUAL BASIC PAST-PAPERS',style:
              TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(onTap: () async {
                    const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);


                    openPDF(context, file);
                  },
                    title: const Text(''),
                    leading: Image.asset('assets/Image 7.png'),),
                  ListTile(onTap: () async {
                    const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);


                    openPDF(context, file);
                  },
                    title: Text(''),
                  ),


                  ListTile(onTap: ()async {
                    const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                  },
                    title: const Text(''),
                  ),
                  ListTile(onTap: () async{const url = '/module two/notes/';
                  final file = await PDFApi.loadFirebase(url);
                  openPDF(context, file);
                  },
                    title: const Text(''),
                  ),

                ],
              ),

              ExpansionTile(title: Text('DATABASE MANAGEMENT PAST-PAPERS',style:
              TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: () async{const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],),
              Container(
              alignment: Alignment.bottomCenter,
              width: staticAd.size.width.toDouble(),
              height: staticAd.size.height.toDouble(),
              child: AdWidget(ad: staticAd),
            ),
              ExpansionTile(title: Text('COMPUTER APPLICATION PAST-PAPERS',
                style: TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA JULY 2016 PRAC'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA JULY 2017 PRACTICAL'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA JULY 2017 PRACTICAL'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA NOVEMBER 2018 THEORY'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA JULY 2019 THEORY'),
                  ),
                  ListTile(
                    onTap: () async{const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA JULY 2019 PRACTICAL'),
                  ),
                  ListTile(
                    onTap: () async{const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('CA NOVEMBER 2021 THEORY'),
                  ),
                ],),
              ExpansionTile(title:  Text('SYSTEM ANALYSIS DESIGN PAST-PAPERS',style:
              TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),


                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),


                  ListTile(
                    onTap: ()async {const url = '/module two/notes/';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text(''),
                  ),
                ],),
              ExpansionTile(title:  Text('QUANTITATIVE METHODS',style:
              TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  ListTile(onTap: () async{const url = '/module two/pastpapers/quantitathive/QUANTITATIVE 2016.pdf';
                  final file = await PDFApi.loadFirebase(url);
                  openPDF(context, file);
                  },
                    title: Text('QUANTITATIVE 2016'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/pastpapers/quantitative/QUANTITATIVE 2017 JULY.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('QUANTITATIVE 2017 JULY'),
                  ),
                  ListTile(
                    onTap: ()async {const url = '/module two/pastpapers/quantitative/QUANTITATIVE 2017 NOV.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                    title: Text('QUANTITATIVE 2017 NOV'),
                  ),
                  ListTile(onTap: ()async {const url = '/module two/pastpapers/quantitative/QUANTITATIVE 2018 NOV.pdf';
                  final file = await PDFApi.loadFirebase(url);
                  openPDF(context, file);
                  },
                    title: Text('QUANTITATIVE 2018 NOV'),
                  ),

                ],),
              Container(
              alignment: Alignment.bottomCenter,
              width: staticAd.size.width.toDouble(),
              height: staticAd.size.height.toDouble(),
              child: AdWidget(ad: staticAd),
            ),
              ExpansionTile(title:  Text('OBJECT ORIENTED PAST-PAPERS',style:
              TextStyle(color: Colors.deepPurple[800],fontWeight: FontWeight.bold),),
                  leading: Image.asset('assets/Image 5.png'),
                  children: [
                    ListTile(onTap: ()async {const url = '/module two/pastpapers/oop/OOP2014july.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: const Text('OOP 2014 JULY'),
                    ),
                    ListTile(onTap: ()async {const url = '/module two/pastpapers/oop/OOP2014nov.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP 2014 NOVEMBER'),
                    ),
                    ListTile(onTap: () async{const url = '/module two/pastpapers/oop/OOP2016july.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP JULY 2016'),
                    ),
                    ListTile(onTap: () async{const url = '/module two/pastpapers/oop/OOP2017july.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP JULY 2017'),
                    ),
                    ListTile(onTap: () async{const url = '/module two/pastpapers/oop/OOP2017nov.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP NOVEMBER 2017'),
                    ),
                    ListTile(onTap: () async{const url = '/module two/pastpapers/oop/OOP2018nov.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP NOVEMBER 2018'),
                    ),
                    ListTile(onTap: () async{const url = '/module two/pastpapers/oop/OOP2019july.pdf';
                    final file = await PDFApi.loadFirebase(url);
                    openPDF(context, file);
                    },
                      title: Text('OOP JULY 2019'),
                    ),


                  ]
              )
            ]
        )
    );



  }

  void openPDF(BuildContext context, File file,) =>
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));


}
