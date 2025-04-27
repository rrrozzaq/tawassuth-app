import 'package:flutter/material.dart';
import '../asset_image.dart';
import '../../../utils/color.dart';

class TFilledButton extends StatelessWidget {
  const TFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.foregroundColor,
    this.backgroundColor,
    this.boldText = true,
    this.isFullWidth = false,
    this.setCenter = true,
    this.borderRadius = 10,
  });

  final String label;
  final String? icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final bool boldText;
  final bool isFullWidth;
  final bool setCenter;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 45),
        backgroundColor: backgroundColor ?? TColors.mainColor,
        foregroundColor: foregroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment:
            setCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            TAssetImage(icon!, height: 24),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: boldText ? FontWeight.bold : null,
              color: foregroundColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
