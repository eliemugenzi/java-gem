import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/components/textinput_component.dart';
import 'package:javagem/utils/colors.dart';
import 'package:javagem/utils/constants.dart';
import 'package:javagem/utils/notifiers/login_notifier.dart';
import 'package:javagem/utils/styles.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final formKey = GlobalKey<FormBuilderState>();

    ref.listen<LoginState>(loginProvider, (previousState, currentState) {
      if (currentState.token != null) {
        context.go(Routes.home);
      }
    });

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
          key: formKey,
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
                    formKey.currentState?.fields['email']?.validate();
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
                    formKey.currentState?.fields['password']?.validate();
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
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        //? Validations are passing...

                        ref.read(loginProvider.notifier).login(
                              emailController.text,
                              passwordController.text,
                            );

                      } else {
                        debugPrint('Validation failed');
                      }
                    },
                    style: CustomStyles.buttonStyle,
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (loginState.isLoading)
                  const CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (loginState.error != null)
                  Text(
                    loginState.error!,
                    style: TextStyle(color: Colors.red),
                  ),
                

              ],
            ),
          ),
        )),
      )),
    );
  }
}
