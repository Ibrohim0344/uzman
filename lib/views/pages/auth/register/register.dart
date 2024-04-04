import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/storage/local_storage.dart';
import '../../../../data/tools/constants/strings/strings.dart';
import '../../../../domains/entities/user/user_local_info.dart';
import '../../base/base_page.dart';
import '../login/login_page.dart';
import '../widgets/ask_account.dart';
import '../widgets/auth_text_field.dart';
import '../../../widgets/main_button.dart';
import '../widgets/my_outlined_button.dart';
import '../widgets/text_between_divider.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/language/getx_translation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passConfirmController;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkboxNotifier = ValueNotifier<bool>(false);
  bool obscurePassword = true;
  String iconPassword = KTIcons.eyeSlash;

  void getToLogin() => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );

  String? validateName(String? value) {
    final name = value!.trim();
    if (name.isEmpty) {
      return "Please fill in this field";
    }
    return null;
  }

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

  String? confirmPassword(String? value) {
    final password = value!.trim();
    if (password.isEmpty) {
      return 'Please fill in this field';
    } else if (passConfirmController.text != passwordController.text) {
      return 'Please confirm your password';
    }
    return null;
  }

  void validate() {
    if (_formKey.currentState!.validate()) {
      LocalStorage.identifyUser();
      final user = UserLocalInfo(
        fullName: nameController.text.trim(),
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
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passConfirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passConfirmController.dispose();
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
                  lang.createAccount,
                  style: ktBodyImmenseStyle,
                ),
              ),
              AuthTextField(
                "Full Name",
                prefixIcon: SvgPicture.asset(KTIcons.email),
                controller: nameController,
                validator: validateName,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 12),
              AuthTextField(
                lang.email,
                prefixIcon: SvgPicture.asset(KTIcons.email),
                controller: emailController,
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              AuthTextField(
                lang.password,
                prefixIcon: SvgPicture.asset(KTIcons.lock),
                suffixIcon: SvgPicture.asset(iconPassword),
                controller: passwordController,
                obscureText: obscurePassword,
                makeObscure: makeObscure,
                validator: validatePassword,
              ),
              const SizedBox(height: 12),
              AuthTextField(
                lang.confirmPassword,
                prefixIcon: SvgPicture.asset(KTIcons.lock),
                suffixIcon: SvgPicture.asset(iconPassword),
                textInputAction: TextInputAction.done,
                obscureText: obscurePassword,
                controller: passConfirmController,
                makeObscure: makeObscure,
                validator: confirmPassword,
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
              MainButton(
                lang.register,
                size.width,
                onPressed: validate,
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AskAccount(
                  question: lang.yesAccount,
                  navigate: lang.enter,
                  getTo: getToLogin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
