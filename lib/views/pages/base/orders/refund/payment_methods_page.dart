import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/assets/images.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/dialogs/app_dialogs.dart';
import '../../../../../data/tools/extensions/int_extensions.dart';
import '../../../../widgets/main_button.dart';
import '../../profile/widgets/contact_button.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  String groupValue = "uzcard";
  List<String> values = ["uzcard", "humo", "cash"];

  void onMethodChanged(value) {
    groupValue = value;
    setState(() {});
  }

  void refundDialog(Size size) => AppDialogs.refundSuccessDialog(context, size);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.paymentMethods),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              lang.choosePaymentMethod,
              style: ktMediumStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ContactButton(
            imagePath: KTImages.uzcard,
            title: "Uzcard",
            onTap: () => onMethodChanged(values[0]),
            trailing: Radio.adaptive(
              value: values[0],
              groupValue: groupValue,
              onChanged: onMethodChanged,
            ),
          ),
          ContactButton(
            imagePath: KTImages.humo,
            title: "Humo",
            onTap: () => onMethodChanged(values[1]),
            trailing: Radio.adaptive(
              value: values[1],
              groupValue: groupValue,
              onChanged: onMethodChanged,
            ),
          ),
          ContactButton(
            iconPath: KTIcons.wallet,
            title: "Naqd pul",
            onTap: () => onMethodChanged(values[2]),
            trailing: Radio.adaptive(
              value: values[2],
              groupValue: groupValue,
              onChanged: onMethodChanged,
            ),
          ),
          const Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: KTColors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              border: Border.all(color: KTColors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${lang.paid}: \$87.50",
                          textAlign: TextAlign.center,
                          style: ktRegularStyle.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${lang.refund}: \$70.00",
                          style: ktSemiBoldStyle,
                        ),
                      ),
                    ],
                  ),
                  12.gapY(),
                  MainButton(
                    lang.continueWord,
                    size.width,
                    hasElevation: true,
                    onPressed: () => refundDialog(size),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
