import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';

import '../../../core/cores.dart';
import '../../bloc/blocs.dart';
import 'login.dart';

class VerifyEmailPage extends StatefulHookWidget {
  final String email;
  const VerifyEmailPage({
    super.key,
    required this.email,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    final loading = useState(false);
    final showRetry = useState(false);
    final pin = useState('');
    final countdown = useState(60);
    final resendingCode = useState(false);

    useEffect(() {
      Timer.periodic(const Duration(seconds: 1), (t) {
        countdown.value = countdown.value - 1;
        if (countdown.value == 0) t.cancel();
      });
    }, []);

    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            resendingCode.value = false;
            snackBars.success(message: state.error);
          }
          if (state is VerifyEmailSuccess) {
            snackBars.success(message: 'Email Verified!');
            navigationService.pushReplacement(const LoginPage());
          }
          if (state is ResentVerificationSuccess) {
            snackBars.success(message: 'Email Sent!');
            resendingCode.value = false;
            countdown.value = 60;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacing.height(36),
                    const AppText(
                      'Verify Email Ownership',
                      fontSize: 24,
                      color: AppColors.sdn900,
                      fontFamily: FontFamily.outfitBold,
                    ),
                    const Spacing.tinyHeight(),
                    RichText(
                      text: TextSpan(
                          text:
                              'Check your email. We sent a confirmation email containing a 6 digits code to ',
                          children: [
                            TextSpan(
                              text: widget.email,
                              style: const TextStyle(
                                color: AppColors.sdn900,
                                fontFamily: FontFamily.outfitSemiBold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.sdn600,
                            fontFamily: FontFamily.outfitRegular,
                          )),
                      textAlign: TextAlign.center,
                    ),
                    const Spacing.height(64),
                    Pinput(
                      length: 6,
                      onCompleted: (value) {
                        pin.value = value;
                        loading.value = true;
                        authBloc.add(VerifyEmailEvent(
                            pin: pin.value, email: widget.email));
                      },
                      closeKeyboardWhenCompleted: true,
                      autofocus: true,
                      cursor: Container(),
                      defaultPinTheme: PinTheme(
                          height: 48,
                          width: 48,
                          textStyle: const TextStyle(
                              color: AppColors.sdn900,
                              fontFamily: FontFamily.outfitBold),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.sdn200,
                              width: 1,
                            ),
                          )),
                    ),
                    const Spacing.height(16),
                    AppButton(
                      loading: loading.value,
                      onPressed: () {
                        // snackBars.success(message: 'message');
                        if (pin.value.isEmpty) {
                          snackBars.error(
                              message:
                                  'Please enter the code that was sent to your email');
                          return;
                        }
                        loading.value = true;
                        authBloc.add(VerifyEmailEvent(
                            pin: pin.value, email: widget.email));
                      },
                      title: 'Verify',
                    ),
                    const Spacing.height(64),
                    if (countdown.value > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            size: 18,
                          ),
                          AppText(
                            ' ${Duration(seconds: countdown.value).inMinutes.toString().padLeft(2, '0')}:${Duration(seconds: countdown.value).inSeconds >= 60 ? '00' : Duration(seconds: countdown.value).inSeconds.toString().padLeft(2, '0')}',
                            fontSize: 16,
                            color: AppColors.sdn900,
                            fontFamily: FontFamily.outfitRegular,
                          ),
                        ],
                      ),
                    if (countdown.value > 0) const Spacing.height(64),
                    if (countdown.value == 0)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppText(
                            'Yet to receive verification code?',
                            fontSize: 16,
                            color: AppColors.sdn600,
                            // fontFamily: FontFamily.outfitRegular,
                          ),
                          TextButton(
                            onPressed: () {
                              resendingCode.value = true;
                              authBloc.add(
                                  ResendVerificationEvent(email: widget.email));
                            },
                            child: Visibility(
                              visible: !resendingCode.value,
                              replacement: const Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              child: const AppText(
                                'Try Again',
                                color: AppColors.primary,
                                fontSize: 20,
                                fontFamily: FontFamily.outfitBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// class VerifyEmailPage extends HookWidget {
//   final String email;
//   const VerifyEmailPage({
//     Key? key,
//     required this.email,
//   }) : super(key: key);

  
// }
