

import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/landscape_homepage.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/portrait_homepage.dart';
import 'package:flutter/material.dart';

class TabHomepage extends StatelessWidget {
  const TabHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context,orientation){
          return orientation == Orientation.portrait ? const TabPortraitHomepage() : const TabLandscapeHomepage();
        }
    );
  }
}
