import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class AppAsyncLoadingButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String title;
  final Color? color; // background color
  final Color? textColor;
  final double? width;
  final double? borderRadius;
  final ButtonSize size;
  final IconData? icon; // optional icon

  const AppAsyncLoadingButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.textColor,
    this.width,
    this.borderRadius,
    this.size = ButtonSize.medium,
    this.icon,
  });

  @override
  State<AppAsyncLoadingButton> createState() => _AppAsyncLoadingButtonState();
}

class _AppAsyncLoadingButtonState extends State<AppAsyncLoadingButton> {
  bool _isLoading = false;

  double get _height {
    switch (widget.size) {
      case ButtonSize.small:
        return 36;
      case ButtonSize.medium:
        return 45;
      case ButtonSize.large:
        return 55;
    }
  }

  Future<void> _handlePress() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget.onPressed();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.color ?? Colors.blue;
    final txtColor = widget.textColor ?? Colors.white;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: _height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: txtColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
        ),
        onPressed: _handlePress,
        child: _isLoading
            ? SizedBox(
                height: _height / 2,
                width: _height / 2,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: txtColor, size: 18),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    widget.title,
                    style: TextStyle(color: txtColor, fontSize: 15),
                  ),
                ],
              ),
      ),
    );
  }
}
