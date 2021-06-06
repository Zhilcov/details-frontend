import 'package:details_frontend/interfaces/drop_down.dart';
import 'package:details_frontend/services/base_api_service.dart';
import 'package:details_frontend/utils/device/response_handler.dart';

import 'drop_down_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppAsyncDropdownSearch extends AppDropdownSearch {
  AppAsyncDropdownSearch({
    key,
    label,
    value,
    items,
    onChange,
    showSearchBox,
  }) : super(
            key: key,
            label: label,
            value: value,
            items: items,
            onChange: onChange,
            showSearchBox: showSearchBox
  );

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropdownItem>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: this.items,
      label: this.label,
      onFind: (String search) async {
        var res = await BaseApi.sandbox().get( "/user", {"search": search});
        print(res);
        // var models = DropdownItem.fromJsonList(handledRes.data);
        return [];
      },
      onChanged: this.onChange,
      showSearchBox: this.showSearchBox,
      itemAsString: (DropdownItem u) => u.label,
      compareFn: (item, selectedValue) {
        return item.value == value;
      },
    );
  }
}
