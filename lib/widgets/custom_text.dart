import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_habido_v2/utils/assets.dart';
import 'package:mobile_habido_v2/utils/size_helper.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';

/// LABEL TYPE
enum CustomTextStyle {
  Caption, // 12.0
  Normal, // 14.0
  Medium, // 16.0
  Large, // 18.0
  Headline6, // 20.0
  Headline5, // 24.0
}

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  /// Main
  final String? text;
  final CustomTextStyle style;

  /// Box constraint arguments
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;

  /// Text arguments
  final Color? color;
  final Color? bgColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? softWrap;
  final int? maxLines;
  final double? lineSpace;
  TextAlign? textAlign;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontStyle fontStyle;
  final bool underlined;
  final Color? underlineColor;
  final BoxBorder? border;

  CustomText(
    this.text, {
    this.style = CustomTextStyle.Medium,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.alignment,
    this.color,
    this.bgColor,
    this.fontSize = 16,
    this.fontWeight,
    this.softWrap,
    this.maxLines,
    this.lineSpace,
    this.textAlign,
    this.overflow,
    this.fontStyle = FontStyle.normal,
    this.fontFamily = FontAsset.SFProRounded,
    this.underlined = false,
    this.underlineColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    if (alignment == Alignment.center) this.textAlign = TextAlign.center;

    return Container(
      margin: margin,
      padding: padding,
      alignment: alignment ?? Alignment.center,
      decoration: BoxDecoration(
        border: border ?? null,
      ),
      child: Text(
        text ?? '',
        softWrap: softWrap ?? true,
        maxLines: maxLines ?? 1,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          color: color ?? _color(),
          fontSize: fontSize ?? _fontSize(),
          fontWeight: fontWeight ?? _fontWeight(),
          height: lineSpace,
          backgroundColor: bgColor,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          decoration: underlined ? TextDecoration.underline : null,
          decorationColor: underlineColor ?? _underlineColor(),
          decorationThickness: 1,
        ),
      ),
    );
  }

  double _fontSize() {
    switch (style) {
      case CustomTextStyle.Caption:
        return SizeHelper.fontSizeCaption;
      case CustomTextStyle.Normal:
        return SizeHelper.fontSizeNormal;
      case CustomTextStyle.Medium:
        return SizeHelper.fontSizeMedium;
      case CustomTextStyle.Large:
        return SizeHelper.fontSizeLarge;
      case CustomTextStyle.Headline6:
        return SizeHelper.fontSizeHeadline6;
      case CustomTextStyle.Headline5:
        return SizeHelper.fontSizeHeadline5;
      default:
        return SizeHelper.fontSizeNormal;
    }
  }

  Color? _color() {
    switch (style) {
      default:
        return customColors.mainGohan;
    }
  }

  Color? _underlineColor() {
    switch (style) {
      default:
        return customColors.mainGohan;
    }
  }

  FontWeight _fontWeight() {
    switch (style) {
      default:
        return fontWeight ?? FontWeight.w600;
    }
  }
}

class SectionTitleText extends StatelessWidget {
  final String? text;
  final EdgeInsets? margin;

  const SectionTitleText({Key? key, this.text, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          // SvgPicture.asset(Assets.scratch),
          Expanded(
            child: CustomText(
              text,
              margin: EdgeInsets.only(left: 15.0),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
