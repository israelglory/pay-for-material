import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pay_for_material/core/cores.dart';
import 'package:pay_for_material/presentation/views/auth/login.dart';
import 'package:pay_for_material/presentation/views/auth/widgets/shadow_box.dart';

class MatricVerification extends HookWidget {
  const MatricVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final matricTEC = useTextEditingController();
    final loading = useState(false);
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacing.height(103.0),
              const AppText(
                'Payformaterial',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                alignment: TextAlign.center,
                color: AppColors.appBlack,
              ),
              const Spacing.height(85.0),
              ShadowBox(
                child: Column(
                  children: [
                    const AppText(
                      'Welcome to Payformaterial',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      alignment: TextAlign.center,
                      color: AppColors.appBlack,
                    ),
                    const Spacing.height(4.0),
                    const AppText(
                      'Setup your account to continue ',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      alignment: TextAlign.center,
                      color: AppColors.appBlack,
                    ),
                    const Spacing.height(24.0),
                    AppTextField(
                      textEditingController: matricTEC,
                      maxLines: 1,
                      hintText: 'Matric No:',
                      backgroundColor: AppColors.appGrey,
                    ),
                    const Spacing.height(16.0),
                    AppButton(
                      loading: loading.value,
                      onPressed: () {
                        navigationService.pushReplacement(const LoginPage());
                      },
                      title: 'Proceed',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
