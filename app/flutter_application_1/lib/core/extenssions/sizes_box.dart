import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtensionBox on num {
  Widget get widthBox => SizedBox(
        width: ScreenUtil().setWidth(this is int ? toDouble() : this),
      );

  Widget get heightBox => SizedBox(
        height: ScreenUtil().setHeight(this is int ? toDouble() : this),
      );
}