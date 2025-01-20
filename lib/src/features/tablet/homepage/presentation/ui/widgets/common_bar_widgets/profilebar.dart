

import 'package:flutter/material.dart';

import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            profileCard(radius: 32),
            w16,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi,',style: mbr1,),
                Text('John Doe',style: mbh3,)
              ],
            ),
          ],
        ),
        Text('January 20, 2025',style: mbs1,)
      ],
    );
  }
}
