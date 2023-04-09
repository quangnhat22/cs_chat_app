import 'package:flutter/material.dart';

Center gg_signin() {
    return Center(
                      child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(239, 237, 237, 1),
                            foregroundColor: const Color.fromRGBO(120, 120, 120, 1),
                            minimumSize: const Size.fromHeight(55),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage("assets/icons/google_logo.png"),
                                  height: 33.0,
                                  width: 33.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 8),
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: ,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      );
  }