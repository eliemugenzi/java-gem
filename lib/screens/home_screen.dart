import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                  debugPrint('Things are happening!:  $value');

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
                                      child: TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                            focusColor: Colors.white,
                                            label: null,
                                            labelText: null,
                                            hintText: 'Search coffee',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
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
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
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
                                                      AppColors.primary),
                                              padding:
                                                  WidgetStateProperty.all(
                                                      EdgeInsets.all(10))),
                                          onPressed: () {
                                            debugPrint('Pressed');
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
                Positioned(top: 200, left: 10, child: PromoCard())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: HorizontalMenu(items: ['All coffee', 'Mocha', 'Latte', 'Americano', 'African', 'Macchiatto'], selectedItem: selectedCategory.value, onSelect: (value) {
                debugPrint('Things are happening: $value');
                setState(() {
                  selectedCategory.value = value;
                });
              },)
            )
          ],
        ),
      ),
    ));
  }
}
