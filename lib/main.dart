// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show document;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'route/routes.dart';
import 'services/app.dart';
import 'services/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(Portfolio(sharedPreferences: sharedPreferences));
}

class Portfolio extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const Portfolio({
    Key? key,
    required this.sharedPreferences,
  }) : super(key: key);

  @override
  PortfolioState createState() => PortfolioState();
}

class PortfolioState extends State<Portfolio> {
  late AppService _appService;
  late AppRouter _appRouter;
  late AppTheme _appTheme;

  @override
  void initState() {
    _appService = AppService(sharedPreferences: widget.sharedPreferences);
    _appRouter = AppRouter(appService: _appService);
    _appTheme = AppTheme();
    removeLoader();
    super.initState();
  }

  // Remove Preloader
  void removeLoader() {
    var element = document.getElementById("loader");
    if (element != null) {
      debugPrint("Removing Pre-Loader!");
      debugPrint(element.id);
      element.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppService>(create: (_) => _appService),
        ChangeNotifierProvider<AppTheme>(create: (_) => _appTheme),
        Provider<AppRouter>(create: (_) => _appRouter),
      ],
      child: Builder(
        builder: (context) {
          final GoRouter router = Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            title: "Ishanga Vidusha",
            darkTheme: context.read<AppTheme>().theme,
            themeMode: ThemeMode.dark,
            routerConfig: router,
          );
        }
      ),
    );
  }
}