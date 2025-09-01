import 'package:flutter/material.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';
import 'package:mobile_habido_v2/widgets/custom_text.dart';
import 'package:mobile_habido_v2/widgets/loaders.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool isLoading;
  final double height;
  final double minWidth;
  final MainAxisAlignment iconPosition; // Icon зүүн эсвэл баруун талд
  final EdgeInsets? margin;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabledColor,
    this.borderRadius = 99.0,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isLoading = false,
    this.height = 48.0,
    this.minWidth = 120.0,
    this.iconPosition = MainAxisAlignment.start, // default: зүүн талд
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color effectiveTextColor = textColor ?? (onPressed != null ? customColors.mainGohan : Colors.red ?? customColors.mainGohan);

    final Color effectiveBgColor = onPressed != null ? backgroundColor ?? customColors.suppBlue : disabledColor ?? theme.disabledColor;

    return Container(
      margin: margin,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveBgColor,
            disabledBackgroundColor: disabledColor ?? theme.disabledColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: elevation,
            padding: padding,
            minimumSize: Size(minWidth, height),
            textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CustomLoader(),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: iconPosition,
                  children: [
                    if (icon != null && iconPosition == MainAxisAlignment.start)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          icon,
                          size: iconSize ?? 18,
                          color: iconColor ?? effectiveTextColor,
                        ),
                      ),
                    CustomText(
                      text,
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w600,
                      color: effectiveTextColor ?? customColors.mainGohan,
                      // style: TextStyle(
                      //   color: effectiveTextColor,
                      //   fontSize: fontSize,
                      //   fontWeight: fontWeight,
                      // ),
                    ),
                    if (icon != null && iconPosition == MainAxisAlignment.end)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          icon,
                          size: iconSize ?? 18,
                          color: iconColor ?? effectiveTextColor,
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
