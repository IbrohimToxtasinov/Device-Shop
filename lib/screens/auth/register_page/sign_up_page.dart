import 'package:device_shop/data/model/user_model.dart';
import 'package:device_shop/screens/auth/register_page/widgets/app_texformfield_email.dart';
import 'package:device_shop/screens/auth/register_page/widgets/app_textformfield_password.dart';
import 'package:device_shop/screens/auth/register_page/widgets/app_textformfield_username.dart';
import 'package:device_shop/screens/auth/widgets/my_button.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:device_shop/view_model/auth_view_model.dart';
import 'package:device_shop/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
                    style: MyTextStyle.ralewayExtraBold.copyWith(
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
                          style: MyTextStyle.ralewayBold.copyWith(
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
                              style: MyTextStyle.ralewayBold.copyWith(
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

  signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  await  Provider.of<AuthViewModel>(context, listen: false).signUp(
      email: email,
      password: password,
    );
    if(!mounted) return;
    await Provider.of<ProfileViewModel>(context, listen: false).addUser(
      UserModel(
        fcmToken: "",
        age: 18,
        userId: "",
        fullName: usernameController.text,
        email: email,
        createdAt: DateTime.now().toString(),
        imageUrl: "",
        firebaseUid: FirebaseAuth.instance.currentUser!.uid
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
