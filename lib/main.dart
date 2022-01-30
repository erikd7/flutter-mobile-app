import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weatherlite/tabs/locations.dart';
import 'package:weatherlite/tabs/now.dart';
import 'package:weatherlite/tabs/hourly.dart';
import 'package:weatherlite/tabs/daily.dart';
import 'package:weatherlite/api/apis.dart';

Future<void> main() async {
  await dotenv.load(fileName: "env/default.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherLite',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 4, vsync: this);
  final WeatherApi apis = WeatherApi('boston,ma,usa', 'imperial');

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          icon: LocationsIcon(),
        ),
        Tab(
          icon: NowIcon(),
        ),
        Tab(
          icon: HourlyIcon(),
        ),
        Tab(
          icon: DailyIcon(),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTabBar(),
      ),
      body: getTabBarView(
          <Widget>[Locations(), Now(apis: apis), Hourly(), Daily()]),
    );
  }
}
