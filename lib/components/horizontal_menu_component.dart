import 'package:flutter/material.dart';
import 'package:javagem/utils/colors.dart';
import 'package:javagem/utils/notifiers.dart';

class HorizontalMenu extends StatefulWidget {
  const HorizontalMenu(
      {super.key,
      required this.items,
      this.onSelect,
      required this.selectedItem});

  final List<String> items;
  final Function(String)? onSelect;
  final String selectedItem;

  @override
  State<HorizontalMenu> createState() => _HorizontalMenuState();
}

class _HorizontalMenuState extends State<HorizontalMenu> {
  late List<Widget> menuItems;

  @override
  void initState() {
    super.initState();

    menuItems = widget.items.map((value) {
      return ValueListenableBuilder(valueListenable: selectedCategory, builder: (context, selectedCategory, child) {
        return value == selectedCategory
            ? (FilledButton(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.primary)),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(value),
                ),
                onPressed: () {},
              ))
            : (OutlinedButton(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.transparent), ),
                onPressed: () {
                  widget.onSelect!(value);
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(value, style: TextStyle(color: Colors.black),),
                ),
              ));
      });
    }).toList();

  
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      children: menuItems,
    );
  }
}
