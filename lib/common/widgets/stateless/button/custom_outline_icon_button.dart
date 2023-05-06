import 'package:flutter/material.dart';

class COutlineIconButton extends StatelessWidget {
  const COutlineIconButton({
    Key? key,
    this.icon,
    this.onPress,
  }) : super(key: key);

  final IconData? icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(50.0)), //<-- SEE HERE
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0),
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20.0),
          child: Icon(
            icon,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
