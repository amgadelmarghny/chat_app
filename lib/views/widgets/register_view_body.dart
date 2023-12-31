import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/RigisterBloc/register_bloc.dart';
import '../../category/containerbuttom.dart';
import '../../category/textformfield.dart';
import '../../helper/constants.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? emailAddress, passWord;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        autovalidateMode: autovalidateMode,
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
              'Sign Up',
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
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              hintText: 'Password',
              onChange: (data) {
                passWord = data;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account !',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sign In',
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
              text: 'Sign Up',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<RegisterBloc>(context).add(
                    RegisterEvent(
                      emailAddress: emailAddress!,
                      password: passWord!,
                    ),
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
