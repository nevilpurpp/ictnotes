import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import '../../screens/pdf_viewer/pdf_viewer_page.dart';
import '../../services/pdf_api.dart';

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
                  'VISUAL PROGRAMMING',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpapers/VB/';
                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2016 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2016nov.pdf';
                        final file = await PDFApi.loadFirebase(url);

                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2016 november',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2017july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2017 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showRewardedAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2017nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2017 november',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2018july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2018 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2018nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2018 november',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/VB/visual programming2019july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'Visual programming 2019 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'DATABASE MANAGEMENT ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpaper/DBMS/databasemanagement 2016 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2016 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/DBMS/databasemanagement 2016 nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2016 november',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/DBMS/databasemanagement 2017 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2017 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showRewardedAd();
                        const url =
                            '/module two/pastpapers/DBMS/databasemanagement 2017 nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2017 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/DBMS/databasemanagement nov 2018.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2018 november',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/DBMS/databasemanagement 2019 july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'DatabaseManagement 2019 july',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'COMPUTER APPLICATION ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpaper/CA/2014nov-Copy.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2014 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpaper/CA/2015nov-Copy.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2015 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpaper/CA/CA PRAC 2016 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA 2016 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpaper/CA/CA PRAC 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA NOVEMBER 2016 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/CA/CA PRAC 2017 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA JULY 2017 PRACTICAL',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpaper/CA/CA PRAC 2017.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'CA PRAC 2017 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'SYSTEM ANALYSIS DESIGN ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2016july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2016 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2016nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2016 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2017july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2017 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2017nov.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2017 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url = '/module two/pastpapers/SAD/SAD 2018j.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2018 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2019july.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2019 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/SAD/SAD 2021 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'SAD 2021 NOVEMBER',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                  'QUANTITATIVE METHODS',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Past-Papers',
                  style: TextStyle(color: Colors.white38),
                ),
                leading: Image.asset('assets/Image 5.png'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2016.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2016',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2017 JULY.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2017 JULY',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2017 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2017 NOV',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: const Color.fromARGB(246, 4, 34, 55),
                      onTap: () async {
                        showInterstistialAd();
                        const url =
                            '/module two/pastpapers/quantitative/QUANTITATIVE 2018 NOV.pdf';
                        final file = await PDFApi.loadFirebase(url);
                        openPDF(context, file);
                      },
                      title: const Text(
                        'QUANTITATIVE 2018 NOV',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
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
                    'OBJECT ORIENTED ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Past-Papers',
                    style: TextStyle(color: Colors.white38),
                  ),
                  leading: Image.asset('assets/Image 5.png'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2014july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP 2014 JULY',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2014nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP 2014 NOVEMBER',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2016july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2016',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2017july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2017',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2017nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP NOVEMBER 2017',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2018nov.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP NOVEMBER 2018',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(246, 4, 34, 55),
                        onTap: () async {
                          showInterstistialAd();
                          const url =
                              '/module two/pastpapers/oop/OOP2019july.pdf';
                          final file = await PDFApi.loadFirebase(url);
                          openPDF(context, file);
                        },
                        title: const Text(
                          'OOP JULY 2019',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
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
