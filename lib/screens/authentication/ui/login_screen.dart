import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/components/button/outlined_button.dart';
import 'modals/login_modal.dart';
import '../../../utils/ui_helper.dart';

import '../../../core/components/asset_image.dart';
import '../../../generated/assets.gen.dart';
import 'modals/signup_modal.dart';

@RoutePage()
class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                width: double.maxFinite,
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
                const Row(
                  spacing: 16,
                  children: [LoginModals(), SignupModal()],
                ),
                buldDividerOr(context, 'Or Login With'),
                loginWithGoogle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TOutlinedButton loginWithGoogle() {
  return TOutlinedButton(
    label: 'Continue With Google',
    boldText: false,
    icon: Assets.icons.google,
    onPressed: () {},
  );
}

Row buldDividerOr(BuildContext context, String text) {
  return Row(
    spacing: 10,
    children: [
      Expanded(child: Container(height: 1, color: Colors.black12)),
      Text(text, style: Theme.of(context).textTheme.bodyMedium),
      Expanded(child: Container(height: 1, color: Colors.black12)),
    ],
  );
}
