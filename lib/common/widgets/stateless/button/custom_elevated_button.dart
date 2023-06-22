import 'package:chatapp/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool isEnable;

  const CustomElevatedButton({
    super.key,
    this.buttonText,
    this.onPressed,
    this.backgroundColor,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isEnable ? backgroundColor : Colors.grey[400]),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(
          buttonText?.toUpperCase() ?? "",
          style: AppTextStyles.textButtonStyle,
        ),
      ),
    );
  }
}
