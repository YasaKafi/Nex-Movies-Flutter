import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLOR
const Color primaryColor = Color(0xFF4E4479);
const Color backgroundColor = Color(0xFF0C0C0C);
const Color primaryHeaderTextColor = Color(0xFF4E4479);
const Color universalText = Color(0xFFFFFFFF);
const Color universalText50 = Color(0x80FFFFFF);
const Color hintWhiteColor = Color(0xB3FFFFFF);
const Color hintTextColor = Color.fromRGBO(107, 107, 107, 1);
const Color softGreyColor = Color.fromRGBO(65, 65, 65, 1);
const Color lineColor = Color.fromRGBO(181, 181, 181, 1);
const Color offButtonColor = Color.fromRGBO(203, 203, 203, 1);
const Color warningColor = Color.fromRGBO(143, 42, 42, 1);
const Color headerTextColor = Color.fromRGBO(61, 20, 10,1);
const Color navBarActiveColor = Color(0xFFBA68C8);
const Color navBarBackgroundColor = Colors.black87;



formatFontSize(int fontSize) {
  return fontSize * 0.95;
}

//FONT STYLES INITIAL
TextStyle primaryTextStyle = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: softGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: formatFontSize(18)
    )
);

TextStyle hintTextStyle = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: formatFontSize(14)
    )
);

TextStyle favoriteHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: primaryHeaderTextColor,
        fontWeight: FontWeight.w700,
        fontSize: formatFontSize(31)
    )
);

TextStyle homeHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: universalText50,
        fontWeight: FontWeight.w700,
        fontSize: formatFontSize(30)
    )
);

TextStyle semiHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: universalText,
        fontWeight: FontWeight.w600,
        fontSize: formatFontSize(17)
    )
);

TextStyle semiHomeHeader = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: hintWhiteColor,
        fontWeight: FontWeight.w600,
        fontSize: formatFontSize(17)
    )
);



TextStyle commonText = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: universalText,
        fontWeight: FontWeight.w500,
        fontSize: formatFontSize(12),

    )
);
TextStyle descText = GoogleFonts.nunito(
    textStyle: TextStyle(
        color: universalText,
        fontWeight: FontWeight.w500,
        fontSize: formatFontSize(9)
    )
);



TextStyle authMethodText({required bool isTextButton}) {
  return GoogleFonts.nunito(
      textStyle: TextStyle(
          color: primaryColor,
          fontWeight: isTextButton ? FontWeight.w600 : FontWeight.w400,
          fontSize: formatFontSize(16)
      )
  );
}


