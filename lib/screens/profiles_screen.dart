import 'package:flutter/material.dart';

import 'package:match_maker/common/colors.dart';
import 'package:match_maker/containers/profiles_container.dart';

class ProfilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.white, child: ProfilesContainer());
  }
}
