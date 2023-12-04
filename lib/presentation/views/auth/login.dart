import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pay_for_material/core/cores.dart';
import 'package:pay_for_material/presentation/views/auth/widgets/shadow_box.dart';
import 'package:pay_for_material/presentation/views/student/home/student_home.dart';

import '../../bloc/blocs.dart';
import '../app_nav/app_nav.dart';
import 'account_type.dart';
import 'forget_password.dart';
import 'widgets/widgets.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameTEC = useTextEditingController();
    final passwordTEC = useTextEditingController();
    final confirmPasswordTEC = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final loading = useState(false);
    final passwordVisible = useState(false);
    final confirmpasswordVisible = useState(false);
    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            snackBars.error(message: state.error);
          }
          if (state is LoginSuccess) {
            loading.value = false;
            snackBars.success(
                message: 'Welcome, ${appGlobals.user?.firstName}');
            Console.log('tag', state.userType);
            navigationService.pushReplacement(const AppNav());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27.0),
                  child: Form(
                    key: formKey.value,
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
                        const Spacing.height(61.0),
                        ShadowBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextField(
                                textEditingController: nameTEC,
                                hintText: 'Name',
                                backgroundColor: AppColors.appGrey,
                              ),
                              const Spacing.mediumHeight(),
                              AppTextField(
                                textEditingController: passwordTEC,
                                obscureText: !passwordVisible.value,
                                maxLines: 1,
                                obscureChar: '●',
                                hintText: 'Password',
                                backgroundColor: AppColors.appGrey,
                                suffixIcon: IconButton(
                                  onPressed: () => passwordVisible.value =
                                      !passwordVisible.value,
                                  icon: passwordVisible.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility_rounded),
                                ),
                              ),
                              const Spacing.mediumHeight(),
                              AppTextField(
                                textEditingController: confirmPasswordTEC,
                                obscureText: !confirmpasswordVisible.value,
                                maxLines: 1,
                                obscureChar: '●',
                                hintText: 'Confirm Password',
                                backgroundColor: AppColors.appGrey,
                                suffixIcon: IconButton(
                                  onPressed: () => confirmpasswordVisible
                                      .value = !confirmpasswordVisible.value,
                                  icon: confirmpasswordVisible.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility_rounded),
                                ),
                              ),
                              const Spacing.mediumHeight(),
                              AppButton(
                                loading: loading.value,
                                onPressed: () {
                                  // snackBars.success(message: 'message');
                                  if (!formKey.value.currentState!.validate()) {
                                    return;
                                  }
                                  loading.value = true;

                                  navigationService
                                      .pushReplacement(const StudentHome());
                                },
                                title: 'Proceed',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
