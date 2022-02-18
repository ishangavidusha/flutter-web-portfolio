import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppService _appService;

  @override
  void initState() {
    _appService = Provider.of<AppService>(context, listen: false);
    onInit();
    super.initState();
  }

  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _appService.startUpCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          // Positioned.fill(child: Center(
          //   child: CircularProgressIndicator(),
          // )),
        ],
      ),
    );
  }
}