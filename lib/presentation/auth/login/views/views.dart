import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            gradient: LinearGradient(colors: [
              Color.fromRGBO(51, 161, 253, 1), // colorblue[800]
              Color.fromRGBO(51, 161, 253, 1),  //colorblue[600]
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 24.0),
                child: Column(
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
                  ]),
              ),
            ),
            Expanded(
              flex: 8,
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
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
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
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                        height: 25.0,
                      ),
                      const Center(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromRGBO(214, 104, 95, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(214, 104, 95, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(73, 188, 246, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                        const SizedBox(
                        height: 25.0,
                        ),
                        Center(
                          child:
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(239, 237, 237, 1),
                                foregroundColor: const Color.fromRGBO(120, 120, 120, 1),
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
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
                                      height: 24.0,
                                      width: 24,
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
                          ),
                        const SizedBox(
                        height: 25.0,
                        ),
                      Center(
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
                                      color: Colors.blue,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700))
                                  ]
                        )),),
                        const SizedBox(
                        height: 25.0,
                        ),
                    ]),
                ),
              )),
        ]),
    )));
  }
}
