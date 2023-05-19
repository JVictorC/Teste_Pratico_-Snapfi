import 'package:flutter/material.dart';

class StructureBase extends StatelessWidget {
  const StructureBase({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  final Widget child;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: SafeArea(
        bottom: true,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
