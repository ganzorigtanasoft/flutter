import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_habido_v2/helpers/constant.dart';
import 'package:mobile_habido_v2/localization/localization.dart';
import 'package:mobile_habido_v2/route/router.dart';
import 'package:mobile_habido_v2/utils/assets.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';
import 'package:mobile_habido_v2/widgets/custom_button.dart';
import 'package:mobile_habido_v2/widgets/custom_text.dart';

class CustomLoginBottomSheet extends StatelessWidget {
  final VoidCallback onPhoneLoginPressed;
  final VoidCallback onGoogleLoginPressed;
  final VoidCallback onAppleLoginPressed;

  const CustomLoginBottomSheet({
    super.key,
    required this.onPhoneLoginPressed,
    required this.onGoogleLoginPressed,
    required this.onAppleLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: customColors.primaryNight,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(width: 1, color: customColors.borderColor),
          ),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 4,
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: customColors.midagray,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Лого
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.notextLogo,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              CustomText(
                LocaleKeys.registrationSection,
                fontSize: 18,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 8),
              CustomText(
                LocaleKeys.registerDesc,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: customColors.defaultTertiary,
                maxLines: 10,
                margin: EdgeInsets.only(bottom: 24),
              ),

              // Утасны дугаар
              GestureDetector(
                onTap: () {
                  NavigationKey.navKey.currentState?.pushNamed(Routes.createPhone);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: customColors.mainTrunks,
                    ),
                    color: customColors.gray.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: CustomText(
                    LocaleKeys.registerPhoneNumber,
                  ),
                ),
              ),
              SvgPicture.asset(Assets.verLine),

              // Google
              Container(
                margin: EdgeInsets.only(bottom: 16, top: 16),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: customColors.mainBeerus,
                  ),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.google),
                    CustomText(
                      LocaleKeys.registerGoogle,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: customColors.mainBeerus,
                  ),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.apple),
                    CustomText(
                      LocaleKeys.registerApple,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
