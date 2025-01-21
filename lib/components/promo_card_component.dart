import 'package:flutter/material.dart';
import 'package:javagem/utils/colors.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Promo'),
                ),
              ),
              const SizedBox(height: 15,),
              const Text('Buy one, get one FREE', style: TextStyle(color: Colors.white, fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}
