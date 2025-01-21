import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/components/textinput_component.dart';
import 'package:javagem/utils/constants.dart';
import 'package:javagem/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(Routes.welcome);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              children: <Widget>[
                 const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  'Please login to access your account!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextInput(
                  controller: emailController,
                  name: 'email',
                  label: 'Email address',
                  placeholder: 'Email address',
                  onChanged: (String? value) {
                    _formKey.currentState?.fields['email']?.validate();
                  },
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email()
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextInput(
                  controller: passwordController,
                  name: 'password',
                  secureText: true,
                  label: 'Password',
                  placeholder: 'Password',
                  onChanged: (String? value) {
                    _formKey.currentState?.fields['password']?.validate();
                  },
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(Routes.login);
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        //? Validations are passing...
                        context.go(Routes.home);

                      } else {
                        debugPrint('Validation failed');
                      }
                    },
                    style: CustomStyles.buttonStyle,
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        )),
      )),
    );
  }
}
