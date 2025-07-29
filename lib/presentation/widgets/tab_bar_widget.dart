import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      dividerColor: AppColors.kPrimaryColor,
      labelColor:AppColors.kPrimaryColor,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(text: 'Manual Tasks'),
        Tab(text: 'Auto Assignments'),
      ],
    );
  }
}