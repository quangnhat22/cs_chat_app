import 'package:flutter/material.dart';

Center signin_btn() {
    return Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(73,188,246,1),
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(55),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 22,
                            // color: ,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          ),
                      ),
                    );
  }