import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class AppAsyncLoadingButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Widget? child;
  final RxBool? isLoading;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final Color? textColorreq;

  AppAsyncLoadingButton({
    super.key,
    this.title,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.borderRadius,
    RxBool? isLoading, this.bgColor,  this.textColorreq,
  }) : isLoading = isLoading ?? false.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    //final Color bgColor = AppColors.kPrimaryColor;
    final Color textColor = isDark ? Colors.black : Colors.white;

    return Obx(() {
      final loading = isLoading?.value ?? false;

      return SizedBox(
        width: width ?? double.infinity,
        height: height ?? 52,
        child: ElevatedButton(
          onPressed: loading ? null : onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
           foregroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius ?? BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: loading
              ? SpinKitThreeBounce(
                  color: textColor,
                  size: 20,
                )
              : child ??
                  Text(
                    title ?? 'Save',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColorreq ?? textColor,
                    ),
                  ),
        ),
      );
    });
  }
}

class AppBackOutlineButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AppBackOutlineButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color borderColor = isDark ? Colors.white54 : Colors.black26;
    final Color textColor = isDark ? Colors.white70 : const Color(0xFF1D3557);

    return SizedBox(
      height: 52,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap ?? () => Get.back(),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: textColor,
        ),
        child: Text(
          'Back',
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
