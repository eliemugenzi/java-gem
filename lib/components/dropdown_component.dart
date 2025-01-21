import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {required this.items, required this.value, this.onSelect, super.key});

  final List<String> items;
  final ValueChanged<String?>? onSelect;
  final String value;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<DropdownMenuItem<String>>? dropdownItems;
  @override
  void initState() {
    super.initState();
    dropdownItems = widget.items
        .map((value) => DropdownMenuItem(value: value, child: Text(value, style: TextStyle(color: Colors.white))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: TextStyle(color: Colors.white),
      items: dropdownItems,
      onChanged: widget.onSelect,
      value: widget.value,
      dropdownColor: Colors.black,
    );
  }
}
