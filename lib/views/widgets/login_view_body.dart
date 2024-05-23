import 'package:codmego_chat/bloc/Loginbloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../category/containerbuttom.dart';
import '../../category/textformfield.dart';
import '../../helper/constants.dart';
import '../register_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? emailAddress, password;

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    kLogo,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CodeMego',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              hintText: 'Email or Phone Number',
              onChange: (data) {
                emailAddress = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              suffixIcon: isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              suffixOnPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              textInputType: TextInputType.visiblePassword,
              obscureText: isObscure,
              hintText: 'Password',
              onChange: (data) {
                password = data;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account !',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterView.id);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'LogIn',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginEvent(
                      emailAddress: emailAddress!,
                      password: password!,
                    ),
                  );
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
