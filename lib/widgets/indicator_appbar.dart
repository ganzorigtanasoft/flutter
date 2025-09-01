import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_habido_v2/helpers/constant.dart';
import 'package:mobile_habido_v2/helpers/responsive_flutter.dart';
import 'package:mobile_habido_v2/utils/assets.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';

PreferredSizeWidget indicatorAppBar(
  BuildContext context, {
  double? percent,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(ResponsiveFlutter.of(context).hp(15)),
    child: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        margin: EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                GestureDetector(
                  onTap: () {
                    NavigationKey.navKey.currentState?.pop();
                  },
                  child: SvgPicture.asset(
                    Assets.backButton,
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                    child: percent != null
                        ? LayoutBuilder(
                            builder: (context, constraints) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: LinearProgressIndicator(
                                  value: percent.clamp(0.0, 1.0),
                                  minHeight: 8,
                                  backgroundColor: customColors.defaultBackground,
                                  valueColor: AlwaysStoppedAnimation<Color>(customColors.primaryGreen),
                                  borderRadius: BorderRadius.circular(30),
                                  semanticsLabel: '${(percent * 100).toInt()}%',
                                ),
                              );
                            },
                          )
                        : SizedBox()),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
