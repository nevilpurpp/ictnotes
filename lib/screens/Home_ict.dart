import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ictnotes/module_one_items/module_one.dart';

import '../module_three_items/module_three.dart';
import '../module_two_items/module_two.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/ad_helper.dart';

const int maxAttemps = 3;

class HomeIct extends StatefulWidget {
  const HomeIct({Key? key}) : super(key: key);

  @override
  _HomeIctState createState() => _HomeIctState();
}

class _HomeIctState extends State<HomeIct> {
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

  String status = "";
  late StreamSubscription subscription;
  Future<void> checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setState(() {
        status = 'no internet connection';
      });
    }
  }

  @override
  void initState() {
    loadStaticBannerAd();
    loadinlineBannerAd();
    createInterstitialAd();
    createRewardedAd();
    checkConnectivity();
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        content: Text('no internet connection'),
        actions: [
          OutlinedButton.icon(
              onPressed: () => exit(0),
              icon: Icon(Icons.close_rounded),
              label: Text('exit'))
        ],
      ));
      setState(() {
        status = result.name;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    const double heightInDesign = 600;
    const double widthInDesign = 500;
    const double padding = 18;
    // ignore: non_constant_identifier_names
    double SpaceBetween = 24;
    final double responsiveWidth =
        (deviceWidth / 2) - padding - (SpaceBetween / 2);
    final double responsiveHeight =
        (heightInDesign / widthInDesign) * responsiveWidth;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.indigo[800],
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            title: const Text('ICT NOTES AND PAST PAPERS'),
            centerTitle: true,
            expandedHeight: 300,
            actions: [
              IconButton(
                  onPressed: () {
                    showRewardedAd();
                  },
                  icon: const Icon(Icons.video_library_outlined))
            ],
            flexibleSpace: Flexible(
              child: Container(),
            ),
          ),
          //sliver items
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRect(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.deepPurple]),
                    ),
                    height: responsiveHeight,
                    width: responsiveWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                              width: responsiveWidth,
                              height: responsiveHeight,
                              child: Image.asset('assets/Image 3.png')),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Text(
                              'MODULE ONE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        const Expanded(
                            child:
                                SizedBox(child: Icon(Icons.arrow_forward_ios))),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModuleOne()));
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRect(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.deepPurple, Colors.blue]),
                    ),
                    height: responsiveHeight,
                    width: responsiveWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                              width: responsiveWidth,
                              height: responsiveHeight,
                              child: Image.asset('assets/Image 3.png')),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            width: 200,
                            child: Text(
                              'MODULE TWO',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        const Expanded(
                            child: SizedBox(
                                height: 50,
                                width: 100,
                                child: Icon(Icons.arrow_forward_ios))),
                      ],
                    ),
                  ),
                  onTap: () {
                    showInterstistialAd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModuleTwo()));
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: inlineAd.size.width.toDouble(),
              height: inlineAd.size.height.toDouble(),
              child: AdWidget(ad: inlineAd),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRect(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.deepPurple]),
                    ),
                    height: responsiveHeight,
                    width: responsiveWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                              width: responsiveWidth,
                              height: responsiveHeight,
                              child: Image.asset('assets/Image 3.png')),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Text(
                              'MODULE THREE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        const Expanded(
                            child:
                                SizedBox(child: Icon(Icons.arrow_forward_ios))),
                      ],
                    ),
                  ),
                  onTap: () {
                    showInterstistialAd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModuleThree()));
                  },
                ),
              ),
            ),
          ),
          //banner ads
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: staticAd.size.width.toDouble(),
              height: staticAd.size.height.toDouble(),
              child: AdWidget(ad: staticAd),
            ),
          ),
        ],
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}
