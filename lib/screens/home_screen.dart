import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/components/cofee_card_component.dart';
import 'package:javagem/components/dropdown_component.dart';
import 'package:javagem/components/horizontal_menu_component.dart';
import 'package:javagem/components/promo_card_component.dart';
import 'package:javagem/utils/colors.dart';
import 'package:javagem/utils/notifiers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> locations = <String>[
    'Helsinki, Finland',
    'Cairo, Egypt',
    'Camden, East London',
    'Kigali, Rwanda',
    'Kilimani, Nairobi'
  ];
  String locationValue = 'Helsinki, Finland';

  List<String> coffeeCategories = [
    'All coffee',
    'Mocha',
    'Latte',
    'Americano',
    'African',
    'Macchiatto'
  ];

  List<Map<String, dynamic>> coffeeData = [
    {
      "name": "Caffe Mocha",
      "description": "Deep Foam",
      "price": 2000,
      "ratings": 4,
      "image":
          "https://images.pexels.com/photos/30313264/pexels-photo-30313264/free-photo-of-creamy-cappuccino-with-pistachio-garnish-on-wooden-tray.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "name": "Flat white",
      "description": "Espresso",
      "price": 1000,
      "ratings": 3,
      "image":
          "https://images.pexels.com/photos/30299810/pexels-photo-30299810/free-photo-of-artistic-heart-pattern-in-coffee-foam-close-up.jpeg?auto=compress&cs=tinysrgb&w=800"
    },
    {
      "name": "Latte",
      "description": "Caffe Latte",
      "price": 2000,
      "ratings": 4,
      "image":
          "https://images.pexels.com/photos/30313264/pexels-photo-30313264/free-photo-of-creamy-cappuccino-with-pistachio-garnish-on-wooden-tray.jpeg?auto=compress&cs=tinysrgb&w=600"
    },
    {
      "name": "Americano",
      "description": "Caffe Americano",
      "price": 2000,
      "ratings": 4,
      "image":
          "https://images.pexels.com/photos/30313264/pexels-photo-30313264/free-photo-of-creamy-cappuccino-with-pistachio-garnish-on-wooden-tray.jpeg?auto=compress&cs=tinysrgb&w=600"
    }
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Black background color for status bar
        statusBarIconBrightness: Brightness.light, // Light icons for contrast
      ),
    );
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Location',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomDropdown(
                                  items: locations,
                                  value: locationValue,
                                  onSelect: (String? value) {
                                    debugPrint(
                                        'Selected location:  $value');

                                    if (value != null && value.isNotEmpty) {
                                      setState(() {
                                        locationValue = value;
                                      });
                                    }
                                  },
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 5,
                                      child: SizedBox(
                                        width: 300,
                                        height: 50,
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                              focusColor: Colors.white,
                                              label: null,
                                              labelText: null,
                                              hintText: 'Search coffee',
                                              
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                      height: 50,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: AppColors.primary,
                                        ),
                                        child: FilledButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        Colors.transparent),
                                                padding:
                                                    WidgetStateProperty.all(
                                                        EdgeInsets.all(10))),
                                            onPressed: () {
                                            },
                                            child: const Icon(Icons.tune)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  Positioned(top: 200, left: 25, child: PromoCard())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: HorizontalMenu(
                      items: coffeeCategories,
                      selectedItem: selectedCategory.value,
                      onSelect: (value) {
                        setState(() {
                          selectedCategory.value = value;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: coffeeData.length,
                  itemBuilder: (context, index) {
                    return CoffeeCard(
                        name: coffeeData[index]['name'],
                        description: coffeeData[index]['description'],
                        price: coffeeData[index]['price'],
                        ratings: coffeeData[index]['ratings'],
                        image: coffeeData[index]['image'], onTap: () {
                          context.go('/coffee/details');
                          // Handle the tap event
                        },);
                    // return Center(child: Text(index.toString()),);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
