import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/repository/analytics_repository.dart';
import 'package:jjc/screen/home/cartoes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jjc/shared/utils/mensagens.dart';
import 'package:jjc/widgets/scaffoldStandart.dart'; // important
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var analyticsService = GetIt.I.get<AnalyticsService>();
  //final _notifications = FlutterLocalNotificationsPlugin();

  final Mensagens mensagens = Mensagens();

  @override
  void initState() {
    //initNotifications();
    super.initState();
  } 



  @override
  Widget build(BuildContext context) {  

    return ScaffoldStandart(
      bodyElement: const cartoes(),
      titulo: AppLocalizations.of(context)!.tituloHome,
      index: 0,
      button: true,
    );
  }

  Future<Null> _sendAnalytics() async {
    await analyticsService.analytics.logEvent(name: 'name');
  }

  /* Future<void> showScheduledNotification({
    int id = 0,
    title, 
    body, 
    scheduledDate, 
    notificationDetails, 
  }) async => _notifications.zonedSchedule(
    id, 
    title, 
    body, 
    tz.TZDateTime.from(scheduledDate, tz.local), 
    notificationDetails,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
    androidAllowWhileIdle: true
  ); */

  /* Future<void> setWeekMonthNotifications()async{

    DateTime now = new DateTime.now();

    for (var i = 0; i < 7; i++) {

      
      DateTime date = DateTime(now.year, now.month, now.day, 20).add(Duration(days: i+2));
      //DateTime date = DateTime.now().add(Duration(seconds: i+20));

      await showScheduledNotification(
        id: i,
        title: mensagens.titulos[i],
        body: mensagens.notificacoes[i],
        scheduledDate: date,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
              'full screen channel id', 'full screen channel name',
              channelDescription: 'full screen channel description',
              priority: Priority.high,
              importance: Importance.high,
              fullScreenIntent: true)),
      );
    }

    await showScheduledNotification(
      id: 99,
      title: mensagens.titulos[0],
      body: mensagens.despedida,
      scheduledDate: DateTime(now.year, now.month, now.day, 20).add(Duration(days: 28)),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
            'full screen channel id', 'full screen channel name',
            channelDescription: 'full screen channel description',
            priority: Priority.high,
            importance: Importance.high,
            fullScreenIntent: true))
    );

  } */

  /* void initNotifications() async {

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);

    await _notifications.initialize(initializationSettings);

    tz.initializeTimeZones();
    //await _notifications.cancelAll().then((value) => print('asdxcv'));
    await _notifications.cancelAll();
    await setWeekMonthNotifications();
    final List<PendingNotificationRequest> pendingNotificationRequests =
    await _notifications.pendingNotificationRequests();
    //print(pendingNotificationRequests);
  } */


}