import 'package:flutter/material.dart';

/// A widget that provides a responsive layout for different screen sizes.
///
/// This widget dynamically displays a UI based on the platform's screen width.
/// If the screen width is less than 600 pixels, it renders the [mobileBody].
/// Otherwise, it renders the [tabBody].
class ResponsiveLayout extends StatelessWidget {
  /// The widget to display when the platform is identified as mobile (screen width < 600).
  final Widget mobileBody;

  /// The widget to display when the platform is identified as tablet (screen width >= 600).
  final Widget tabBody;

  /// Creates a [ResponsiveLayout] widget.
  ///
  /// Both [mobileBody] and [tabBody] are required parameters and should not be null.
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      /// Uses [LayoutBuilder] to determine the screen's width and decide which body to render.
      builder: (context, constraint) {
        // If the maximum width of the constraints is less than 600 pixels,
        // it returns the mobile UI ([mobileBody]).
        if (constraint.maxWidth < 600) {
          return mobileBody;
        }
        // Otherwise, it returns the tablet UI ([tabBody]).
        else {
          return tabBody;
        }
      },
    );
  }
}
