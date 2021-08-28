import 'package:astro_refresh_indicator/astro_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: const Color(0xFF342b76),
        primaryColor: const Color(0xFF342b76),
        scaffoldBackgroundColor: const Color(0xFF342b76),
        cardColor: const Color(0xFF49448c),
      ),
      home: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 3000));

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshConfiguration(
        headerTriggerDistance: 155,
        child: SmartRefresher(
          header: const AstroRefreshIndicator(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemBuilder: (c, i) => const Card(),
            itemExtent: 200,
            itemCount: 5,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
