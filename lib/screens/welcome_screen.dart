import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/utils/constants.dart';
import 'package:javagem/utils/styles.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Lottie.asset('assets/lotties/coffee-animation.json'),
              const Text(
                'Fall in love with Coffee with Blissful Delight!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(Routes.login);
                  },
                  style: CustomStyles.buttonStyle,
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
