import 'package:flutter/material.dart';


Row divider() {
    return Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(151, 151, 151, 1)
                            ),
                          ),
                        ],
                      );
  }