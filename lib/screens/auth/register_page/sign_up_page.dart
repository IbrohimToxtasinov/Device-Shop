// import 'package:device_shop/screens/auth/widgets/my_rich_text.dart';
// import 'package:device_shop/utils/colors.dart';
// import 'package:device_shop/utils/my_utils.dart';
// import 'package:device_shop/utils/styles.dart';
// import 'package:device_shop/view_model/auth_view_model.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

//   final VoidCallback onClickedSignIn;

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.black,
//       appBar: AppBar(
//           title: const Text(
//         "Sign Up",
//       )),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: TextFormField(
//                   controller: emailController,
//                   textInputAction: TextInputAction.next,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (email) =>
//                       email != null && !EmailValidator.validate(email)
//                           ? "Enter a valid email"
//                           : null,
//                   style: MyTextStyle.sfProRegular.copyWith(
//                     color: MyColors.white,
//                     fontSize: 17,
//                   ),
//                   decoration: getInputDecoration(label: "Email"),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: TextFormField(
//                   controller: passwordController,
//                   textInputAction: TextInputAction.next,
//                   obscureText: true,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (password) =>
//                       password != null && password.length < 6
//                           ? "Enter at least 6 charcter !"
//                           : null,
//                   style: MyTextStyle.sfProRegular.copyWith(
//                     color: MyColors.white,
//                     fontSize: 17,
//                   ),
//                   decoration: getInputDecoration(label: "Password"),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: TextFormField(
//                   controller: confirmPasswordController,
//                   textInputAction: TextInputAction.done,
//                   obscureText: true,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (password) =>
//                       password != null && password.length < 6
//                           ? "Enter at least 6 charcter !"
//                           : null,
//                   style: MyTextStyle.sfProRegular.copyWith(
//                     color: MyColors.white,
//                     fontSize: 17,
//                   ),
//                   decoration: getInputDecoration(label: "Confirm password"),
//                 ),
//               ),
//               SizedBox(height: 50),
//               TextButton(onPressed: signUp, child: Text("Sign Up")),
//               SizedBox(height: 20),
//               MyRichText(
//                 onTap: widget.onClickedSignIn,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   signUp() {
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;

//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String confirmPassword = confirmPasswordController.text.trim();

//     if (confirmPassword == password) {
//       Provider.of<AuthViewModel>(context,listen: false).signUp(
//         email: email,
//         password: password,
//       );
//     } else {
//       MyUtils.getMyToast(message: "Passwords don't match!");
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
// }

import 'package:device_shop/screens/auth/register_page/widgets/app_texformfield_email.dart';
import 'package:device_shop/screens/auth/register_page/widgets/app_textformfield_password.dart';
import 'package:device_shop/screens/auth/register_page/widgets/app_textformfield_username.dart';
import 'package:device_shop/screens/auth/widgets/my_button.dart';
import 'package:device_shop/screens/auth/login_page/widgets/my_textformfield.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const RegisterPage({super.key, required this.onClickedSignIn});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
bool isVisiblity = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: MyColors.c5956E9,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text("Create account",
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
                      Text("Register",
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )),
                      const SizedBox(height: 24),
                      MyTextFormFieldUsername(
                        imageName: MyIcons.person,
                        hintName: "Username",
                        controller: usernameController,
                      ),
                      const SizedBox(height: 24),
                      MyTextFormFieldEmail(
                        imageName: MyIcons.message,
                        hintName: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 24),
                      AppTextFormFieldPassword(
                        imageName: MyIcons.lock,
                        hintName: "Password",
                        isVisiblity: isVisiblity,
                        onTap: () {
                          setState(() {
                            isVisiblity = !isVisiblity;
                          });
                        },
                        suffixText: "show",
                        controller: passwordController,
                      ),
                      const SizedBox(height: 40),
                      MyButton(
                        onTap: signUp,
                        color: MyColors.c5956E9,
                        name: "Register",
                        textColor: MyColors.cFFFFFF,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              widget.onClickedSignIn();
                            },
                            child: Text(
                              "Login",
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
      ),
    );
  }

  signUp() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    Provider.of<AuthViewModel>(context, listen: false).signUp(
      email: email,
      password: password,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
