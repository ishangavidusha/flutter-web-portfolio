import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app.dart';
import '../utils/widgets/menu_bars.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AppService _appService;
  late AnimationController _entryAnimationController;
  late Animation<double> _entryAnimation;

  @override
  void initState() {
    _appService = Provider.of<AppService>(context, listen: false);
    _entryAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _entryAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _entryAnimationController, curve: Curves.easeIn));
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => startAnimations());
    super.initState();
  }

  void startAnimations() {
    _entryAnimationController.forward().then((value) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _entryAnimationController.reverse().then((value) => onInit());
    });
  }

  void onInit() {
    _appService.startUpCheck();
  }

  @override
  void dispose() {
    _entryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: FadeTransition(
                opacity: _entryAnimation,
                child: AppLogo(onTap: () {  }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}