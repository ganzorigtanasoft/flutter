import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool extendBody; // bottom nav-ийн доорх body-г өргөтгөх эсэх
  final double? appBarElevation;
  final Color? statusBarColor;
  final Brightness statusBarBrightness; // iOS дээр нөлөөлөх
  final Brightness statusBarIconBrightness; // Android дээр
  final EdgeInsets? padding;
  final String? backgroundImage;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.extendBody = false,
    this.appBarElevation,
    this.statusBarColor,
    this.statusBarBrightness = Brightness.light,
    this.statusBarIconBrightness = Brightness.dark,
    this.padding,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets effectivePadding = padding ?? const EdgeInsets.all(24.0);
    final bool hasBackgroundImage = backgroundImage != null;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        // statusBarColor: Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor ?? customColors.primaryNight,
        // backgroundColor: hasBackgroundImage ? null : (backgroundColor ?? customColors.primaryNight),

        appBar: hasBackgroundImage ? null : appBar as PreferredSizeWidget?,
        body: hasBackgroundImage
            ? Stack(
                children: [
                  // 1. Background image (бүх хуудсыг дүүргэнэ)
                  Positioned.fill(
                    child: Image.asset(
                      backgroundImage!,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 2. AppBar (давхардуулсан)
                  if (appBar != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: appBar!,
                    ),

                  // 3. Content (SafeArea + padding)
                  Positioned.fill(
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: appBar != null ? kToolbarHeight : effectivePadding.top,
                          bottom: effectivePadding.bottom,
                          left: effectivePadding.left,
                          right: effectivePadding.right,
                        ),
                        child: body ?? const SizedBox(),
                      ),
                    ),
                  ),
                ],
              )
            : SafeArea(
                child: Padding(
                  padding: effectivePadding,
                  child: body ?? const SizedBox(),
                ),
              ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // extendBody: extendBody,
        extendBodyBehindAppBar: hasBackgroundImage,
      ),
    );
  }
}
