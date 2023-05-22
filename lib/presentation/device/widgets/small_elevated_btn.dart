part of device_administration_lib;


class SmallElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const SmallElevatedButton(
      this.buttonText, this.onPressed, this.backgroundColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(
          buttonText.toUpperCase(),
          style: AppTextStyles.textButtonStyle,
        ),
      ),
    );
  }
}