import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  final bool hasMenu;
  final void Function()? onTapBack;

  BaseAppBar({
    super.key,
    this.hasMenu = true,
    this.onTapBack,
    Widget? title,
    List<Widget>? actions,
  }) : super(
          title: title,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: onTapBack,
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset("assets/images/arrow_back.png"),
              ),
            ),
          ),
          actions: actions,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        );
}
