import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/controller/authentication_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    final authUser = ref.watch(authProvider).user;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("user id: ${authUser.id}"),
            Text("user email: ${authUser.email}"),
            Text("email verified: ${authUser.emailVerified}"),
            TextButton(
              child: const Text("SignOut"),
              onPressed: () {
                authController.onSignOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}