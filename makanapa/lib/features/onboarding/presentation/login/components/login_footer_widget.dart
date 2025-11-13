import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/constants/key_constant.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/button/social_button.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';

class LoginFooter extends StatefulHookConsumerWidget {
  const LoginFooter({super.key});

  @override
  ConsumerState<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends ConsumerState<LoginFooter> {
  late final GoogleSignIn _googleSignIn;
  final List<String> scopes = <String>['email', 'profile'];

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    if (user == null) {
      return;
    }

    final idToken = user.authentication.idToken;

    final authorization =
        await user.authorizationClient.authorizationForScopes(scopes) ??
        await user.authorizationClient.authorizeScopes(scopes);

    if (idToken == null) {
      LogHelper.error("Id Token is null");
      return;
    }

    final googleRequest = GoogleSignInRequest(
      accessToken: authorization.accessToken,
      idToken: idToken,
      userName: user.displayName ?? "null",
      email: user.email,
      avatar: user.photoUrl,
    );

    ref.read(loginControllerProvider.notifier).loginWithGoogle(googleRequest);
  }

  Future<void> _handleAuthenticationError(Object e) async {}

  @override
  void initState() {
    super.initState();
    String serverKey = dotenv.get(KeyConstant.gClientId);

    _googleSignIn = GoogleSignIn.instance;
    unawaited(
      _googleSignIn.initialize(serverClientId: serverKey).then((_) {
        _googleSignIn.authenticationEvents
            .listen(_handleAuthenticationEvent)
            .onError(_handleAuthenticationError);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> signInWithGoogle() async {
      try {
        await GoogleSignIn.instance.authenticate();
      } catch (e) {
        if (context.mounted) {
          SnackBarHelper.showError(context, e.toString());
        }
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialLoginButton(
          text: "Masuk dengan Google",
          onPressed: () {
            signInWithGoogle();
          },
        ),
        Dimens.lg.space,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // Default text style for all spans
                style: context.bodyMedium,
                children: <TextSpan>[
                  const TextSpan(text: 'Belum punya akun? '),
                  TextSpan(
                    text: 'Daftar disini',
                    style: const TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ref.read(loginControllerProvider.notifier).openSignUp();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
