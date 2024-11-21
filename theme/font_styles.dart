part of constants;

const Color defaultTextColor = ColorPalette.purple;

class FontStyles {
  static TextStyle fontRegular12 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size12.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fontRegular14 = TextStyle(
    fontSize: Sizes.size14,
    height: LineHeight.lineHeight24.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fontRegular16 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size16.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fontRegular24 = TextStyle(
    fontSize: Sizes.size24.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fontRegular42 = TextStyle(
    fontSize: Sizes.size42.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fontSemiBold14 = TextStyle(
    fontSize: Sizes.size14.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle fontSemiBold16 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size16.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle fontSemiBold24 = TextStyle(
    fontSize: Sizes.size24.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle fontBold14 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size14.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle fontBold16 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size16.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle fontBold20 = TextStyle(
    fontSize: Sizes.size20.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle fontBold24 = TextStyle(
    fontSize: Sizes.size24.sp,
    color: defaultTextColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle fontUnderlineBlueText = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size16.sp,
    color: defaultTextColor,
    decoration: TextDecoration.underline,
  );

  static TextStyle fontBoldPurple16 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size16.sp,
    color: ColorPalette.purple,
    fontWeight: FontWeight.w700,
  );

  static TextStyle fontBoldPurpleLight20 = TextStyle(
    height: LineHeight.lineHeight18,
    fontSize: Sizes.size20.sp,
    color: ColorPalette.purple20,
    fontWeight: FontWeight.w700,
  );
}

class LineHeight {
  /// Line height for text of 16px
  static double lineHeight16 = 1.2;

  /// Line height for text of 18px
  static double lineHeight18 = 1.4;

  /// Line height for text of 24px
  static double lineHeight24 = 1.6;
}
