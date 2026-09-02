import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCorners {
  AppCorners._();

  static double sm = 3.r;
  static BorderRadius smBorder = BorderRadius.all(smRadius);
  static Radius smRadius = Radius.circular(sm);

  static double med = 5.r;
  static BorderRadius medBorder = BorderRadius.all(medRadius);
  static Radius medRadius = Radius.circular(med);

  static double lg = 10.r;
  static BorderRadius lgBorder = BorderRadius.all(
    lgRadius,
  );
  static Radius lgRadius = Radius.circular(lg);

  static double xlg = 15.r;
  static BorderRadius xlgBorder = BorderRadius.all(xlgRadius);
  static Radius xlgRadius = Radius.circular(xlg);

  static double xl2g = 25.r;
  static BorderRadius xl2gBorder = BorderRadius.all(xl2gRadius);
  static double xl3g = 50.r;
  static BorderRadius xl3gBorder = BorderRadius.all(xl3gRadius);
  static Radius xl3gRadius = Radius.circular(xl3g);
  static Radius xl2gRadius = Radius.circular(xl2g);
}