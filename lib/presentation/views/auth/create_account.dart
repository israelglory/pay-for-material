import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/cores.dart';
import '../../../data/data.dart';
import '../../bloc/blocs.dart';
import 'verify_email.dart';
import 'widgets/widgets.dart';

class CreateAccountPage extends HookWidget {
  final String role;
  const CreateAccountPage({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTEC = useTextEditingController();
    final passwordTEC = useTextEditingController();
    final firstNameTEC = useTextEditingController();
    final lastNameTEC = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final loading = useState(false);
    final passwordVisible = useState(false);
    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            snackBars.success(message: state.error);
          }
          if (state is RegisterSuccess) {
            snackBars.success(message: 'Registration Successful');
            navigationService.pushReplacement(
              VerifyEmailPage(
                email: emailTEC.text.trim(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacing.height(36),
                    const AppText(
                      'Get Started',
                      fontSize: 24,
                      color: AppColors.sdn900,
                      fontFamily: FontFamily.outfitBold,
                    ),
                    const Spacing.tinyHeight(),
                    const AppText(
                      'Just one more step to create your first test!',
                      fontSize: 16,
                      color: AppColors.sdn600,
                      // fontFamily: FontFamily.outfitRegular,
                    ),
                    const Spacing.bigHeight(),

                    // Spacing.bigHeight(),
                    const Padding(
                      padding: EdgeInsets.all(36.0),
                      child: OrDivider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            'First Name',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: firstNameTEC,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter first name' : null,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Last Name',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: lastNameTEC,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter last name' : null,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Email Address',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: emailTEC,
                            validator: (val) => val!.isEmpty
                                ? 'Please enter a valid Email\n'
                                : null,
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Password',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: passwordTEC,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter password' : null,
                            obscureText: !passwordVisible.value,
                            maxLines: 1,
                            obscureChar: '●',
                            suffixIcon: IconButton(
                              onPressed: () => passwordVisible.value =
                                  !passwordVisible.value,
                              icon: passwordVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          const Spacing.mediumHeight(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppRectangle(
                                radius: 8,
                                width: 24,
                                color: AppColors.primary,
                                height: 24,
                                child: Icon(
                                  Icons.done,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                              ),
                              const Spacing.smallWidth(),
                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                      text: 'I have read and agree to the ',
                                      children: [
                                        TextSpan(
                                          text: 'Terms & Conditions',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontFamily: FontFamily.outfitBold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(text: ' and the '),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontFamily: FontFamily.outfitBold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(text: ' of this website.')
                                      ],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.sdn600,
                                        fontFamily: FontFamily.outfitRegular,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const Spacing.bigHeight(),
                          AppButton(
                            loading: loading.value,
                            onPressed: () {
                              // navigationService.push(
                              //   VerifyEmailPage(
                              //     email: emailTEC.text.trim(),
                              //   ),
                              // );
                              if (!formKey.value.currentState!.validate()) {
                                return;
                              }
                              loading.value = true;
                              authBloc.add(
                                RegisterEvent(
                                    param: RegisterParam(
                                  email: emailTEC.text.trim(),
                                  firstName: firstNameTEC.text.trim(),
                                  lastName: firstNameTEC.text.trim(),
                                  password: passwordTEC.text.trim(),
                                  role: role,
                                )),
                              );
                            },
                            title: 'Create Account',
                          ),
                          const Spacing.largeHeight(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
