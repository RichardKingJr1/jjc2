import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() {
    //print('firebase');
    return  FirebaseAnalyticsObserver(analytics: analytics);
  }

}  