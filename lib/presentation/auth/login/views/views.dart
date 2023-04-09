import 'package:flutter/material.dart';

import 'component/sign_up.dart';
import 'component/divider.dart';
import 'component/sign_in_btn.dart';
import 'component/gg_signin_btn.dart';
import 'component/forgot_password.dart';
import 'component/title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(51, 161, 253, 1),
            height: 154,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 24.0),
              child: title(),
            ),
          ),
          Container(
            color: const Color.fromRGBO(51, 161, 253, 1),
            // flex: 9,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 40, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textfield_name(),
                    textfield(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.lock,
                            color: Color.fromRGBO(39, 101, 193, 1),
                            size: 25),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                            child: RichText(
                              text: const TextSpan(
                                text: 'Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan> [
                                  TextSpan(text: ' (*)',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700))
                                ])
                      ))],
                    )),

                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFE7EDEB),
                        hintText: '**********',
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Color.fromRGBO(39, 101, 193, 1))
                      ),
                    ),
                    const SizedBox(
                      height: 28.0,
                    ),
                    forgot_password(),
                    const SizedBox(
                      height: 28.0,
                    ),
                    signin_btn(),
                      const SizedBox(
                      height: 71.0,
                      ),
                      divider(),
                      const SizedBox(
                      height: 71.0,
                      ),
                      gg_signin(),
                      const SizedBox(
                      height: 95.0,
                      ),
                    sign_up(),
                      const SizedBox(
                      height: 25.0,
                      ),
                  ]),
              ),
            )),
        ])));
  }

  

  TextField textfield() {
    return TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFE7EDEB),
                      hintText: 'hello@gmail.com',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  );
  }

  Padding textfield_name() {
    return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.email,
                          color: Color.fromRGBO(39, 101, 193, 1),
                          size: 25),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                          child: RichText(
                            text: const TextSpan(
                              text: 'Email',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              children: <TextSpan> [
                                TextSpan(text: ' (*)',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700))
                              ])
                    ))],
                  ));
  }

  
}
