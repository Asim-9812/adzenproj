





import 'package:flutter/material.dart';

import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Profile',style: mbh2,),
            notificationButton(color: MyColors.grey)
          ],
        ),

      ],
    );
  }
}
