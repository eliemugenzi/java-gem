import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/utils/colors.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  const CoffeeDetailsScreen({super.key});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  Map<String, dynamic> coffeeData = {
    "name": "Americano",
    "description": "Caffe Americano",
    "price": 2000,
    "ratings": 4,
    "image":
        "https://images.pexels.com/photos/30313264/pexels-photo-30313264/free-photo-of-creamy-cappuccino-with-pistachio-garnish-on-wooden-tray.jpeg?auto=compress&cs=tinysrgb&w=600"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          context.go('/home');
        },),
        title: Center(child: Text('Detail')),
        actions: [
        InkWell(child: Icon(Icons.favorite_outline_outlined, color: AppColors.primary, size: 35,)),
        const SizedBox(width: 10,) 
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coffeeData['image'],
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Caffe Mocha', style: TextStyle(fontSize: 18),),
                    const Text('Ice/Hot', style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.directions_bike, color: AppColors.primary),
                    SizedBox(width: 15,),
                    const Icon(Icons.volunteer_activism, color: AppColors.primary),
                    SizedBox(width: 15,),
                                        const Icon(Icons.payments, color: AppColors.primary),

                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Divider(),
            const SizedBox(height: 10,),
            const Text('Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const Text('A cappuccino is an approximately 150 ml (5 oz)', style: TextStyle(color: Colors.grey),)
          ],
        ),
      )),
    );
  }
}
