import 'package:flutter/material.dart';
import '../asset_image.dart';

class TOutlinedButton extends StatelessWidget {
  const TOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.boldText = true,
  });

  final String label;
  final String? icon;
  final VoidCallback onPressed;
  final bool? boldText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 45),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
