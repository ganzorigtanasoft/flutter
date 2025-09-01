import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_habido_v2/helpers/auth_service.dart';
import 'package:mobile_habido_v2/localization/localization.dart';
import 'package:mobile_habido_v2/utils/assets.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';
import 'package:mobile_habido_v2/widgets/custom_button.dart';
import 'package:mobile_habido_v2/widgets/custom_scaffold.dart';
import 'package:mobile_habido_v2/widgets/custom_text.dart';
import 'package:mobile_habido_v2/widgets/login_bottom_sheet.dart';

class LoginIntroScreen extends StatefulWidget {
  const LoginIntroScreen({super.key});

  @override
  State<LoginIntroScreen> createState() => _LoginIntroScreenState();
}

class _LoginIntroScreenState extends State<LoginIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(Assets.logo),
            SvgPicture.asset(Assets.circleLogo),
            Column(
              children: [
                CustomButton(
                  text: LocaleKeys.register,
                  margin: EdgeInsets.only(bottom: 16),
                  onPressed: () {
                    showLoginBottomSheet(context);
                  },
                ),
                CustomButton(
                  text: LocaleKeys.login,
                  backgroundColor: customColors.loginBut.withValues(alpha: 0.3),
                  onPressed: () {},
                ),
                CustomText(
                  'Бүртгүүлэх болон нэвтэрснээр та манай Үйлчилгээний нөхцөл болон Нууцлалын бодлоготой танилцаж, зөвшөөрсөн гэж үзнэ.',
                  fontWeight: FontWeight.w400,
                  color: customColors.midText,
                  maxLines: 10,
                  fontSize: 12,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomLoginBottomSheet(
        onPhoneLoginPressed: () {
          print("Утасны дугаар");
          Navigator.pop(context);
        },
        onGoogleLoginPressed: () async {
          final result = await signInWithGoogle();
          if (result != null) {
            // Амжилттай нэвтэрсэн
            Navigator.pushReplacementNamed(context, '/home'); // Жишээ нь: Home хуудас руу шилжих
          } else {
            // Алдаа эсвэл цуцалсан
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Google-р нэвтрэх амжилтгүй")),
            );
          }
          Navigator.pop(context); // Bottom sheet хаах
        },
        onAppleLoginPressed: () {
          print("Apple");
          Navigator.pop(context);
        },
      ),
    );
  }
}
