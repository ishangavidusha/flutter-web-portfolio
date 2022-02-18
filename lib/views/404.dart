import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ishangavidusha/utils/typography.dart';

class NotFoundPage extends StatelessWidget {
  final GoRouterState state;
  const NotFoundPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Center(
            child: Column(
              children: [
                SubTitle1(state.error.toString()),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
