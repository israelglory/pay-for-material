import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pay_for_material/presentation/views/app_nav/app_nav.dart';

import '../core/cores.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'SimplyAssess',
        navigatorKey: navigationService.navigatorKey,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const AppNav(),
      ),
    );
  }
}
