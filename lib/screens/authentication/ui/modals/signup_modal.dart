import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/button/outlined_button.dart';

import '../../../../core/components/button/filled_button.dart';
import '../../../../core/components/text_field/text_form_field.dart';
import '../../../../utils/color.dart';
import '../login_screen.dart';

class SignupModal extends StatefulWidget {
  const SignupModal({super.key});

  @override
  State<SignupModal> createState() => _SignupModalState();
}

class _SignupModalState extends State<SignupModal> {
  final GlobalKey _signupForm = GlobalKey();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final signEmail = TextEditingController();
  final signPasswordCtrl = TextEditingController();
  final signConfirmPasswordCtrl = TextEditingController();
  bool readPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TOutlinedButton(
        label: 'Sign Up',
        onPressed: () => _showSignUp(context),
      ),
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
                                  buldDividerOr(context, 'Or SignUp With'),
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
