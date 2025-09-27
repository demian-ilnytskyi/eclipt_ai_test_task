import 'package:exlipt_ai_test_task/components/authentication/profile/widget/bloc_provider/proflie_bloc_provider.dart';
import 'package:exlipt_ai_test_task/components/authentication/profile/widget/body/profile_body.dart';
import 'package:exlipt_ai_test_task/shared/shared_flutter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSaffold(body: ProfileBlocProvider(child: ProfileBody()));
  }
}
