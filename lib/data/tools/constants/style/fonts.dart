import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'colors.dart';

final maskFormatterPhoneNumber = MaskTextInputFormatter(
  mask: '+998 (##) ### ## ##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.eager,
);

final maskFormatterDateOfBirth = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.eager,
);

final maskFormatterCard = MaskTextInputFormatter(
  mask: 'XXXX XXXX XXXX XXXX',
  filter: {"X": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

final maskFormatterExpireDateCard = MaskTextInputFormatter(
  mask: 'XX/XX',
  filter: {"X": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.eager,
);

const ktRegularStyle = TextStyle();

const ktEssentialStyle = TextStyle(
  color: KTColors.mainRed,
  fontWeight: FontWeight.w600,
);

const ktOrdinaryMediumStyle = TextStyle(
  fontWeight: FontWeight.w600,
);

const ktLabelStyle = TextStyle(
  fontSize: 12,
  color: KTColors.greyHint,
  fontWeight: FontWeight.w500,
);

const ktLightStyle = TextStyle(
  fontSize: 12,
  color: KTColors.white,
  fontWeight: FontWeight.w300,
);

const ktMediumStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const ktBodyMediumStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const ktButtonTextStyle = TextStyle(
  fontSize: 16,
  color: KTColors.white,
  fontWeight: FontWeight.w700,
);

const ktCategoryTextStyle = TextStyle(
  fontSize: 15,
  color: KTColors.black42,
  fontWeight: FontWeight.w700,
);

const ktSemiBoldStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  fontFamily: "Urbanist",
);

const ktHintStyle = TextStyle(
  color: KTColors.greyHint,
);

const ktSearchStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: KTColors.grey75,
);

const ktTitleMediumStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  fontFamily: "Urbanist",
);

const ktTitleLargeStyle = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.w500,
);

const ktTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

const ktBodyLargeStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const ktBodyImmenseStyle = TextStyle(
  fontSize: 39,
  color: KTColors.black21,
  fontWeight: FontWeight.w700,
);
