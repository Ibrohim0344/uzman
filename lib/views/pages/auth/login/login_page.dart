import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/storage/local_storage.dart';
import '../../../../data/tools/constants/strings/strings.dart';
import '../../../../domains/entities/user/user_local_info.dart';
import '../../base/base_page.dart';
import '../register/register.dart';
import '../widgets/ask_account.dart';
import '../widgets/auth_text_field.dart';
import '../../../widgets/main_button.dart';
import '../widgets/my_outlined_button.dart';
import '../widgets/text_between_divider.dart';
import 'forgot_password/forgot_password_page.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/language/getx_translation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkboxNotifier = ValueNotifier<bool>(false);
  bool obscurePassword = true;
  String iconPassword = KTIcons.eyeSlash;

  void getToRegister() => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const RegisterPage(),
        ),
      );

  void getToForgotPassword() => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => const ForgotPasswordPage(),
      ));

  String? validateEmail(String? value) {
    final email = value!.trim();
    if (email.isEmpty) {
      return "Please fill in this field";
    } else if (!emailRegExp.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    final password = value!.trim();
    if (password.isEmpty) {
      return 'Please fill in this field';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'Please enter a valid password';
    }
    return null;
  }

  void validate() {
    if (_formKey.currentState!.validate()) {
      LocalStorage.identifyUser();
      final user = UserLocalInfo(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      LocalStorage.saveUser(user);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BasePage(),
        ),
        (route) => false,
      );
    }
  }

  void makeObscure() {
    obscurePassword = !obscurePassword;
    iconPassword = obscurePassword ? KTIcons.eyeSlash : KTIcons.eye;
    setState(() {});
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  lang.login,
                  style: ktBodyImmenseStyle,
                ),
              ),
              AuthTextField(
                lang.email,
                prefixIcon: SvgPicture.asset(KTIcons.email),
                validator: validateEmail,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                lang.password,
                prefixIcon: SvgPicture.asset(KTIcons.lock),
                suffixIcon: SvgPicture.asset(iconPassword),
                textInputAction: TextInputAction.done,
                validator: validatePassword,
                makeObscure: makeObscure,
                controller: passwordController,
                obscureText: obscurePassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: checkboxNotifier,
                    builder: (context, value, child) {
                      return Checkbox(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        activeColor: KTColors.mainRed,
                        value: checkboxNotifier.value,
                        onChanged: (value) =>
                            checkboxNotifier.value = !checkboxNotifier.value,
                      );
                    },
                  ),
                  Text(
                    lang.remember,
                    style: ktOrdinaryMediumStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: MainButton(
                  lang.enter,
                  size.width,
                  onPressed: validate,
                ),
              ),
              TextButton(
                onPressed: getToForgotPassword,
                child: Text(
                  "${lang.forgotPassword}?",
                  style: ktEssentialStyle.copyWith(fontSize: 16),
                ),
              ),
              TextBetweenDivider(lang.continueWord),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyOutlinedButton(
                      verticalPadding: 14,
                      child: SvgPicture.asset(KTIcons.facebook),
                    ),
                    MyOutlinedButton(
                      verticalPadding: 14,
                      child: SvgPicture.asset(KTIcons.google),
                    ),
                    MyOutlinedButton(
                      verticalPadding: 14,
                      child: SvgPicture.asset(KTIcons.apple),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AskAccount(
                  question: lang.noAccount,
                  navigate: lang.register,
                  getTo: getToRegister,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
