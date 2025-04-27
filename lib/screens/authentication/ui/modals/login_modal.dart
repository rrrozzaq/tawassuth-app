import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tawassuth/core/router/app_router.gr.dart';
import '../../../../core/components/button/filled_button.dart';

import '../../../../core/components/text_field/text_form_field.dart';
import '../login_screen.dart';

class LoginModals extends StatefulWidget {
  const LoginModals({super.key});

  @override
  State<LoginModals> createState() => _LoginModalsState();
}

class _LoginModalsState extends State<LoginModals> {
  final GlobalKey _loginForm = GlobalKey();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TFilledButton(
        label: 'Login',
        onPressed: () => _showLoginModal(context),
      ),
    );
  }

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
                                    isFullWidth: true,
                                    label: 'Continue',
                                    onPressed:
                                        isFilled
                                            ? () {}
                                            : () {
                                              context.router.pushAndPopUntil(
                                                const HomeRoute(),
                                                predicate: (route) => false,
                                              );
                                            },
                                    backgroundColor:
                                        isFilled ? null : Colors.grey.shade300,
                                  ),
                                  buldDividerOr(context, 'Or Login With'),
                                  loginWithGoogle(),
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
