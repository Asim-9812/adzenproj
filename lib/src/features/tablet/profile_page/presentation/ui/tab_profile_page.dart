import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/widgets/landscape_profile.dart';
import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/widgets/portrait_profile.dart';
import 'package:flutter/material.dart';

class TabProfilePage extends StatelessWidget {
  const TabProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          return orientation == Orientation.portrait ? const TabPortraitProfile() : const TabLandscapeProfile();
        }
    );
  }
}
