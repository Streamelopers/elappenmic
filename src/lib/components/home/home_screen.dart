import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../routes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../services/ads/ad_helper.dart';
import '../../services/notifications/notifications_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  BannerAd? _bannerAd;

  FlutterLocalNotificationsPlugin flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
      if (_isInterstitialAdLoaded) {
        _interstitialAd.show();
      }
    });
  }

  late InterstitialAd _interstitialAd;
  bool _isInterstitialAdLoaded = false;
  void _initAds() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    ).load();

    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isInterstitialAdLoaded = true;
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        appScreens.elementAt(_currentIndex)['screen'] as Widget,
        if (_bannerAd != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          )
      ])),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          items: appScreens
              .map((item) => BottomNavigationBarItem(
                  icon: item["icon"] as Icon, label: item["title"].toString()))
              .toList(),
          onTap: _selectScreen),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  void initState() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterNotificationPlugin.initialize(initializationSettings);
    NotificationsHelper.ScheduleNotifications(flutterNotificationPlugin);
    _initAds();
  }
}
