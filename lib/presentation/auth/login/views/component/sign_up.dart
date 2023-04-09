import 'package:flutter/material.dart';

Center sign_up() {
    return Center(
                    child: RichText(text: const TextSpan(
                      text: "Don't have account? ",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                              children: <TextSpan> [
                                TextSpan(text: 'Sign up',
                                style: TextStyle(
                                  color: Color.fromRGBO(39, 101, 193, 1),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700))
                              ]
                    )),);
  }