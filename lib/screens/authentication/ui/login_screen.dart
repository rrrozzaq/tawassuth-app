import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tawassuth/core/components/button/outlined_button.dart';
import 'package:tawassuth/utils/color.dart';
import 'package:tawassuth/utils/ui_helper.dart';

import '../../../core/components/asset_image.dart';
import '../../../core/components/button/filled_button.dart';
import '../../../core/components/text_field/text_form_field.dart';
import '../../../generated/assets.gen.dart';

@RoutePage()
class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  // login variable
  final GlobalKey _loginForm = GlobalKey();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // signUp variable
  final GlobalKey _signupForm = GlobalKey();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final signEmail = TextEditingController();
  final signPasswordCtrl = TextEditingController();
  final signConfirmPasswordCtrl = TextEditingController();
  bool readPolicy = false;

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();

    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    signEmail.dispose();
    signPasswordCtrl.dispose();
    signConfirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight(context) * .3),
            child: Opacity(
              opacity: .9,
              child: TAssetImage(
                Assets.images.clockBackground.path,
                fit: BoxFit.cover,
                height: screenHeight(context),
              ),
            ),
          ),
          Positioned(
            right: screenWidth(context) * .1,
            top: screenHeight(context) * .15,
            child: TAssetImage(
              Assets.images.tawassuthLogo.path,
              width: screenWidth(context) * .4,
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(top: screenHeight(context) * .68),
            color: Colors.white,
            child: Column(
              spacing: 25,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TFilledButton(
                        label: 'Login',
                        onPressed: () => _showLoginModal(context),
                      ),
                    ),
                    Expanded(
                      child: TOutlinedButton(
                        label: 'Sign Up',
                        onPressed: () => _showSignUp(context),
                      ),
                    ),
                  ],
                ),
                _buldDividerOr(context, 'Or Login With'),
                _loginWithGoogle(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TOutlinedButton _loginWithGoogle() {
    return TOutlinedButton(
      label: 'Continue With Google',
      boldText: false,
      icon: Assets.icons.google,
      onPressed: () {},
    );
  }

  Row _buldDividerOr(BuildContext context, String text) {
    return Row(
      spacing: 10,
      children: [
        Expanded(child: Container(height: 1, color: Colors.black12)),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        Expanded(child: Container(height: 1, color: Colors.black12)),
      ],
    );
  }

  // Show Login Modals =================================================
  void _showLoginModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              emailCtrl.addListener(() => setState(() {}));
              passwordCtrl.addListener(() => setState(() {}));

              bool isFilled =
                  emailCtrl.text.trim().isNotEmpty &&
                  passwordCtrl.text.isNotEmpty;

              return DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.3,
                maxChildSize: 0.95,
                expand: false,
                builder: (_, controller) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  emailCtrl.clear();
                                  passwordCtrl.clear();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              ),
                              Text(
                                "Login Account",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                          Form(
                            key: _loginForm,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                spacing: 20,
                                children: [
                                  TTextFormField(
                                    controller: emailCtrl,
                                    label: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),

                                  TTextFormField(
                                    controller: passwordCtrl,
                                    label: 'Password',
                                    isPassword: true,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Forgot Your Password?',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),

                                  TFilledButton(
                                    label: 'Continue',
                                    onPressed: isFilled ? () {} : () {},
                                    backgroundColor:
                                        isFilled ? null : Colors.grey.shade300,
                                  ),
                                  _buldDividerOr(context, 'Or Login With'),
                                  _loginWithGoogle(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showSignUp(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              firstNameCtrl.addListener(() => setState(() {}));
              lastNameCtrl.addListener(() => setState(() {}));
              signEmail.addListener(() => setState(() {}));
              signPasswordCtrl.addListener(() => setState(() {}));
              signConfirmPasswordCtrl.addListener(() => setState(() {}));

              bool isFilled =
                  firstNameCtrl.text.isNotEmpty &&
                  lastNameCtrl.text.isNotEmpty &&
                  signEmail.text.trim().isNotEmpty &&
                  signPasswordCtrl.text.isNotEmpty &&
                  signConfirmPasswordCtrl.text.isNotEmpty;

              return DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.3,
                maxChildSize: 0.95,
                expand: false,
                builder: (_, controller) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  firstNameCtrl.clear();
                                  lastNameCtrl.clear();
                                  signEmail.clear();
                                  signPasswordCtrl.clear();
                                  signConfirmPasswordCtrl.clear();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              ),
                              Text(
                                "SignUp",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                          Form(
                            key: _signupForm,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                spacing: 20,
                                children: [
                                  TTextFormField(
                                    controller: firstNameCtrl,
                                    label: 'First Name',
                                    keyboardType: TextInputType.text,
                                  ),
                                  TTextFormField(
                                    controller: lastNameCtrl,
                                    label: 'Last Name',
                                    keyboardType: TextInputType.text,
                                  ),
                                  TTextFormField(
                                    controller: signEmail,
                                    label: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  TTextFormField(
                                    controller: signPasswordCtrl,
                                    label: 'Password',
                                    keyboardType: TextInputType.text,
                                    isPassword: true,
                                  ),
                                  TTextFormField(
                                    controller: signConfirmPasswordCtrl,
                                    label: 'Confirmation Password',
                                    keyboardType: TextInputType.text,
                                    isPassword: true,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox.adaptive(
                                        value: readPolicy,
                                        checkColor: Colors.white,
                                        activeColor: TColors.mainColor,
                                        onChanged: (v) {
                                          setState(() {
                                            readPolicy = !readPolicy;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodyMedium,
                                                children: [
                                                  const TextSpan(
                                                    text:
                                                        'I have read and agree to Tawassuth ',
                                                  ),
                                                  TextSpan(
                                                    text: 'Terms',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color:
                                                              TColors.mainColor,
                                                        ),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {},
                                                  ),
                                                  const TextSpan(text: ' and '),
                                                  TextSpan(
                                                    text: 'Privacy Policy',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color:
                                                              TColors.mainColor,
                                                        ),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TFilledButton(
                                    label: 'Continue',
                                    onPressed: isFilled ? () {} : () {},
                                    backgroundColor:
                                        isFilled ? null : Colors.grey.shade300,
                                  ),
                                  _buldDividerOr(context, 'Or SignUp With'),
                                  _loginWithGoogle(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
