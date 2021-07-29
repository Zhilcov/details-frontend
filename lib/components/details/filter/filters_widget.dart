import 'package:details_frontend/components/ui/async_drop_down_search.dart';
import 'package:details_frontend/components/ui/drop_down_search.dart';
import 'package:details_frontend/models/api/drop_down.dart';
import 'package:details_frontend/store/filters/filters_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FiltersWidget extends StatelessWidget {
  final _filters = Get.find<FiltersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Obx(() {
            print('Obx');
            print(_filters.carBrand.value.options[0].toString());
            return AppDropdownSearch(
              label: 'Бренд',
              value: _filters.carBrand.value.value,
              items: _filters.carBrand.value.options,
              onChange: (opt) => {
                if (opt != null) {
                  _filters.setCarBrand(opt.value)
                }
              },
            );
          }),
          Obx(() {
            return AppAsyncDropdownSearch(
              showSearchBox: true,
              label: 'Модель',
              value: _filters.carModel.value.value,
              items: _filters.carModel.value.options,
              onChange: (opt) => {
                if (opt != null) {
                  _filters.setCarModel(opt.value)
                }
              },
            );
          }),
        ],
    );
  }

  Widget _buildField() {
    return Obx(() {
      return AppDropdownSearch(
        label: 'Бренд',
        value: _filters.carBrand.value.value,
        items: _filters.carBrand.value.options,
        onChange: (opt) => {
          if (opt != null) {
            _filters.setCarBrand(opt.value)
          }
        },
      );
    });
  }
}