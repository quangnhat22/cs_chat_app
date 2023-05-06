import 'package:flutter/material.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      minLines: 1,
      maxLines: null,
      // validator: (value) =>
      //     AppCheckValid.checkValid(value, typeCheck, context),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.4),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
    );
  }
}
