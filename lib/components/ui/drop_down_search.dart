import 'package:details_frontend/interfaces/drop_down.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropdownSearch extends StatelessWidget {
  final String label;
  final String? value;
  final List<DropdownItem> items;
  final void Function(DropdownItem? value) onChange;
  final bool showSearchBox;

  const AppDropdownSearch({
    Key? key,
    required this.label,
    this.value,
    required this.items,
    required this.onChange,
    this.showSearchBox = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropdownItem>(
        mode: Mode.MENU,
        showSearchBox: this.showSearchBox,
        showSelectedItem: true,
        items: this.items,
        label: this.label,
        onChanged: this.onChange,
        itemAsString: (DropdownItem u) => u.label,
        compareFn: (item, selectedValue) {
          return item.value == value;
        },
        );
  }
}
