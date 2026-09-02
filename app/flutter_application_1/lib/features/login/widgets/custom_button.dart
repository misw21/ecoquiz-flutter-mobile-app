import 'package:flutter/material.dart';

import '../../../core/extenssions/sizes_box.dart';
import '../../../core/utills/app_colors.dart';
import '../../../core/utills/app_corners.dart';
import '../../../core/widgets/svg_displayer.dart';

class AppMainButton extends StatefulWidget {
  const AppMainButton({
    super.key,
    this.translation,
    this.color,
    this.textColor = Colors.white,
    this.onTap,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.textDecoration,
    this.border,
    this.padding,
    this.child,
    this.decoration,
    this.iconData,
    this.borderColor,
    this.style,
    this.isLoading = false,
  });

  final String? translation;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final BoxDecoration? decoration;
  final Widget? child;
  final String? iconData;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? borderColor;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final BorderRadiusGeometry? border;
  final bool isLoading;

  @override
  _AppMainButtonState createState() => _AppMainButtonState();
}

class _AppMainButtonState extends State<AppMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isLoading ? null : widget.onTap,
      child: Container(
        padding: widget.padding ??
            const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        decoration: widget.decoration ??
            BoxDecoration(
                color: widget.color ?? AppColors.primary,
                borderRadius: widget.border ?? AppCorners.lgBorder,
                border: Border.all(
                    color: widget.borderColor ??
                        widget.color ??
                        AppColors.primary)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.iconData != null)
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgDisplayer(
                  assetName: widget.iconData!,
                  width: 26,
                ),
              ),
            if (widget.iconData != null) 16.widthBox,
            widget.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : (widget.child ??
                    Expanded(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(widget.translation ?? '',
                              maxLines: 1,
                              style: widget.style ??
                                  Theme.of(context)
                                      .primaryTextTheme
                                      .titleLarge!
                                      .copyWith(color: AppColors.white))),
                    ))
          ],
        ),
      ),
    );
  }
}
