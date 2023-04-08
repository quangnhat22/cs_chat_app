import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(51, 161, 253, 1), // colorblue[800]
            Color.fromRGBO(51, 161, 253, 1), //colorblue[600]
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 37.0,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Create your new account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ))
                    ]),
              ),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 40, 9, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.email,
                                      color: Color.fromRGBO(39, 101, 193, 1),
                                      size: 25),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 3, 0, 0),
                                      child: RichText(
                                          text: const TextSpan(
                                              text: 'Email',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: ' (*)',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ])))
                                ],
                              )),
                          TextField(
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
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.lock,
                                      color: Color.fromRGBO(39, 101, 193, 1),
                                      size: 25),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 3, 0, 0),
                                      child: RichText(
                                          text: const TextSpan(
                                              text: 'Password',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: ' (*)',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ])))
                                ],
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
                                suffixIcon: const Icon(Icons.remove_red_eye,
                                    color: Color.fromRGBO(39, 101, 193, 1))),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.lock,
                                      color: Color.fromRGBO(39, 101, 193, 1),
                                      size: 25),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 3, 0, 0),
                                      child: RichText(
                                          text: const TextSpan(
                                              text: 'Confirm password',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: ' (*)',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ])))
                                ],
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
                                suffixIcon: const Icon(Icons.remove_red_eye,
                                    color: Color.fromRGBO(39, 101, 193, 1))),
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(73, 188, 246, 1),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(55),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  )),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: ,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
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
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                    color: Color.fromRGBO(151, 151, 151, 1)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Center(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(239, 237, 237, 1),
                                foregroundColor:
                                    const Color.fromRGBO(120, 120, 120, 1),
                                minimumSize: const Size.fromHeight(55),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                )),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        "assets/icons/google_logo.png"),
                                    height: 33.0,
                                    width: 33.0,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 8),
                                    child: Text(
                                      'Sign up with Google',
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
                          )),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: RichText(
                                text: const TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF787878),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sign In',
                                      style: TextStyle(
                                          color: Color(0xFF2765C1),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700))
                                ])),
                          ),
                        ]),
                  ),
                )),
          ]),
    )));
  }
}
