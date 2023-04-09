import 'package:flutter/material.dart';

Column title() {
    return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: const [
                Text(
                  'Login',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 37.0,
                  fontWeight: FontWeight.w700,
                  )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Sign in your account to see your chating',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ))
              ]);
              }