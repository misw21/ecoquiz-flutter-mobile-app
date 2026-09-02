import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilExtension on num {
  //! Custom extension for horizontal spacing using 'hs'
  Widget get hs => SizedBox(width: w); // Example: 20.hs

  //! Custom extension for vertical spacing using 'vs'
  Widget get vs => SizedBox(height: h); // Example: 15.vs

  //! Creates EdgeInsetsDirectional with all sides having the same padding
  EdgeInsetsDirectional get all => EdgeInsetsDirectional.all(toDouble().r); // line 12
  // Example: Padding(padding: 10.all)

  //! Creates EdgeInsetsDirectional with horizontal padding using 'ph'
  EdgeInsetsDirectional get ph =>
      EdgeInsetsDirectional.symmetric(horizontal: toDouble().w);
  // Example: Padding(padding: 16.ph)

  //! Creates EdgeInsetsDirectional with vertical padding using 'pv'
  EdgeInsetsDirectional get pv =>
      EdgeInsetsDirectional.symmetric(vertical: toDouble().h);
  // Example: Padding(padding: 12.pv)

  //! Creates EdgeInsets with horizontal padding using 'phs'
  EdgeInsets get phs => EdgeInsets.symmetric(horizontal: toDouble().w);
  // Example: Padding(padding: 16.phs)

  //! Creates EdgeInsets with vertical padding using 'pvs'
  EdgeInsets get pvs => EdgeInsets.symmetric(vertical: toDouble().h);
  // Example: Padding(padding: 12.pvs)

  //! Creates EdgeInsets with left padding using 'pl'
  EdgeInsets get pl => EdgeInsets.only(left: toDouble().w);
  // Example: Padding(padding: 12.pl)

  //! Creates EdgeInsets with right padding using 'pr'
  EdgeInsets get pr => EdgeInsets.only(right: toDouble().w);
  // Example: Padding(padding: 12.pr)

  //! Creates EdgeInsets with bottom padding using 'pr'
  EdgeInsets get pb => EdgeInsets.only(bottom: toDouble().w);
  // Example: Padding(padding: 12.pb)

  //! Creates EdgeInsets with top padding using 'pt'
  EdgeInsets get pt => EdgeInsets.only(top: toDouble().w);
  // Example: Padding(padding: 12.pt)
}

extension BuildContextExtension on BuildContext {
  //! Access MediaQuery easily
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //! Get screen width
  double get screenWidth => mediaQuery.size.width;
  // Example:
  // double width = context.screenWidth;

  //! Get screen height
  double get screenHeight => mediaQuery.size.height;
  // Example:
  // double height = context.screenHeight;

  //! Check orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  // Example:
  // if (context.isPortrait) {
  // Perform action for portrait mode
  // } else {
  // Perform action for landscape mode
  // }
}