part of forgot_password;



class BuildSquare extends StatelessWidget {
  const BuildSquare(
    {super.key,
    required this.message});

  final String message;
   @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 27,
            color: AppColors.lightColorScheme.outline,
          ),),
      ),
    );
  }
}
