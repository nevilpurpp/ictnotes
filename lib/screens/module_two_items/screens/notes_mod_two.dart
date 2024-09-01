import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import '../../screens/Home_ict.dart';
import '../../screens/pdf_viewer/pdf_viewer_page.dart';
import '../../services/pdf_api.dart';

class NotesModTwo extends StatefulWidget {
  const NotesModTwo({Key? key}) : super(key: key);

  @override
  State<NotesModTwo> createState() => _NotesModTwoState();
}

class _NotesModTwoState extends State<NotesModTwo> {
  late BannerAd staticAd;
  bool staticAdLoaded = false;

  InterstitialAd? interstitialAd;
  int interstitialAttempt = 0;
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
          if (interstitialAttempt <= maxAttemps) {
            createInterstitialAd();
          }
        }));
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
    createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 20,
            child: Image.asset(
              'assets/visulb.png',
              fit: BoxFit.fill,
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
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.black,
              elevation: 20,
              child: Image.asset(
                'assets/database.png',
                fit: BoxFit.fill,
              ),
            ),
            onTap: () async {
              showInterstistialAd();
              const url = '/module two/notes/dbms_tutorial.pdf';
              final file = await PDFApi.loadFirebase(url);

              openPDF(context, file);
            }),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.black,
            elevation: 5,
            child: Image.asset(
              'assets/computerapplication.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            showInterstistialAd();
            const url = '/module one/notes/Programming in C.pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/systemdesign.png',
              fit: BoxFit.fill,
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
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/quantitativeMethods..png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            showInterstistialAd();
            const url = '/module two/notes/Quantitative Methods(Diploma).pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
        GestureDetector(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: Colors.indigo.shade900,
            elevation: 5,
            child: Image.asset(
              'assets/oop.png',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () async {
            showInterstistialAd();
            const url = '/module two/notes/OOP.pdf';
            final file = await PDFApi.loadFirebase(url);

            openPDF(context, file);
          },
        ),
      ],
    );
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
