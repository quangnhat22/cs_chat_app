part of forgot_password;

class ShortFormCard extends StatelessWidget {
  const ShortFormCard({Key? key, required this.childWidget}) : super(key: key);

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 0.45.sh,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: childWidget,
        ),
      ),
    );
  }
}
