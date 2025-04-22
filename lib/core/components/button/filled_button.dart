import 'package:flutter/material.dart';
import 'package:tawassuth/core/components/asset_image.dart';
import 'package:tawassuth/utils/color.dart';

class TFilledButton extends StatelessWidget {
  const TFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.foregroundColor,
    this.backgroundColor,
    this.boldText = true,
  });

  final String label;
  final String? icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final bool? boldText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 50),
        backgroundColor: backgroundColor ?? TColors.mainColor,
        foregroundColor: foregroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) TAssetImage(icon!, height: 24),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: boldText! ? FontWeight.bold : null,
                  color: foregroundColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
