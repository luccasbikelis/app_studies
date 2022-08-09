
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar? appBar;
  final Color? backgroundColor;
  final Image? image;
  final Image? logo;
  final Image? secondImage;
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onTapSecondImage;

  const AppBarWidget({
    super.key,
    this.appBar,
    this.image,
    required this.title,
    this.onTap,
    this.onTapSecondImage,
    this.secondImage,
    this.logo,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: GestureDetector(
          key: const Key('back_button_key'),
          onTap: onTap,
          child: Center(
            child: SizedBox(
              height: 12,
              width: 16,
              child: image,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: GestureDetector(
              key: const Key('share_button_key'),
              onTap: onTapSecondImage,
              child: Center(
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: secondImage,
                ),
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(
              key: const Key('logo_key'),
              child: logo,
            )
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}