import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_habido_v2/helpers/responsive_flutter.dart';
import 'package:mobile_habido_v2/utils/assets.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';
import 'package:mobile_habido_v2/widgets/custom_scaffold.dart';
import 'package:mobile_habido_v2/widgets/custom_text.dart';
import 'package:mobile_habido_v2/widgets/custom_text_field.dart';
import 'package:mobile_habido_v2/widgets/indicator_appbar.dart';

class CreatePhoneScreen extends StatefulWidget {
  const CreatePhoneScreen({super.key});

  @override
  State<CreatePhoneScreen> createState() => _CreatePhoneScreenState();
}

class _CreatePhoneScreenState extends State<CreatePhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        backgroundImage: Assets.darkNight,
        extendBody: true,
        appBar: indicatorAppBar(context, percent: 0.2),
        body: Column(
          children: [
            CustomText(
              'Та өөрийн утасны дугаарыг оруулна уу',
              fontSize: 20,
              color: customColors.mainBeerus,
              maxLines: 10,
              padding: EdgeInsets.only(top: 24, bottom: 16),
            ),
            SvgPicture.asset(
              Assets.horLine,
              alignment: Alignment.centerLeft,
            ),
            CustomTextField(
              hint: '+976',
              label: '',
            )
          ],
        ));
  }
}
