// import 'package:device_shop/utils/colors.dart';
// import 'package:device_shop/utils/my_utils.dart';
// import 'package:device_shop/utils/styles.dart';
// import 'package:device_shop/view_model/auth_view_model.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key, required this.onClickSignUp}) : super(key: key);

//   final VoidCallback onClickSignUp;

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.black,
//       appBar: AppBar(
//         title: Text("Login"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextFormField(
//                 controller: emailController,
//                 textInputAction: TextInputAction.next,
//                 style: MyTextStyle.sfProRegular.copyWith(
//                   color: MyColors.white,
//                   fontSize: 17,
//                 ),
//                 decoration: getInputDecoration(label: "Email"),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 textInputAction: TextInputAction.done,
//                 style: MyTextStyle.sfProRegular.copyWith(
//                   color: MyColors.white,
//                   fontSize: 17,
//                 ),
//                 decoration: getInputDecoration(label: "Password"),
//               ),
//             ),
//             const SizedBox(height: 100),
//             TextButton(onPressed: signIn, child: Text("Sign In")),
//             SizedBox(height: 20),
//             RichText(
//               text: TextSpan(
//                 style: MyTextStyle.sfProRegular
//                     .copyWith(color: const Color(0xFFFBDF00), fontSize: 18),
//                 text: "Don't have an account?  ",
//                 children: [
//                   TextSpan(
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = widget.onClickSignUp,
//                     text: "Sign Up",
//                     style: MyTextStyle.sfProBold.copyWith(
//                       color: const Color(0xFFFBDF00),
//                       fontSize: 18,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// " Hello World  "

//   Future<void> signIn() async {
//     Provider.of<AuthViewModel>(context,listen: false).signIn(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

import 'package:device_shop/screens/auth/widgets/my_button.dart';
import 'package:device_shop/screens/auth/login_page/widgets/my_textformfield.dart';
import 'package:device_shop/screens/auth/login_page/widgets/my_textformfield_password.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickSignUp;
  const LoginPage({super.key, required this.onClickSignUp});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isVisiblity = false;

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c5956E9,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 70),
              child: Text("Welcome back",
                  style: GoogleFonts.raleway(
                      fontSize: 65,
                      fontWeight: FontWeight.w800,
                      color: MyColors.cFFFFFF)),
            ),
            const SizedBox(height: 40),
            Container(
              height: 1000,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 36, bottom: 150),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: MyColors.cFFFFFF),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      height: 44,
                    ),
                    MyTextFormField(
                        controller: emailController,
                        imageName: MyIcons.message,
                        hintName: 'Email'),
                    const SizedBox(height: 42),
                    MyTextFormFieldPassword(
                      controller: passwordController,
                      imageName: MyIcons.lock,
                      hintName: "Password",
                      isVisiblity: isVisiblity,
                      onTap: () {
                        setState(() {
                          isVisiblity = !isVisiblity;
                        });
                      },
                      suffixText: "show",
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot passcode?",
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: MyColors.c5956E9),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 62),
                    MyButton(
                      onTap: signIn,
                      color: MyColors.c5956E9,
                      name: "Login",
                      textColor: MyColors.cFFFFFF,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            widget.onClickSignUp();
                          },
                          child: Text(
                            "Create account",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: MyColors.c5956E9,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    Provider.of<AuthViewModel>(context, listen: false).signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
