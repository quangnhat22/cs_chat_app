import 'package:flutter/material.dart';

class FloatingActionStadiumButton extends StatelessWidget {
  const FloatingActionStadiumButton({
    super.key,
    this.onPressed,
    this.heroTag,
    this.iconData,
    this.elevation,
  });

  final VoidCallback? onPressed;
  final String? heroTag;
  final IconData? iconData;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation ?? 1,
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      shape: const StadiumBorder(),
      heroTag: heroTag,
      child: Icon(
        iconData ?? Icons.add,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
