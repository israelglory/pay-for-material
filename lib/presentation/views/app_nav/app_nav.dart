import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pay_for_material/presentation/views/auth/matric_verification.dart';
import 'package:pay_for_material/presentation/views/onboarding/intro_page.dart';

import '../../../core/cores.dart';
import '../auth/login.dart';
import '../student/home/student_home.dart';

class AppNav extends HookWidget {
  const AppNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = appGlobals.token != null;
    if (isAuthenticated) {
      return const StudentHome();
    } else {
      return const IntroPage();
    }
  }
}
