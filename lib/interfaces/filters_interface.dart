import 'package:details_frontend/models/api/drop_down.dart';

class BaseFilter {
   String? value;

   BaseFilter({
     this.value
  });
}

class SelectFilter extends BaseFilter {
  List<DropdownItem> options;

  SelectFilter({
    value,
    required this.options,
  }): super(value: value);
}

class AsyncSelectFilter extends SelectFilter {
  String searchUrl;

  AsyncSelectFilter({
    required this.searchUrl
  }): super(value: '', options: []);
}

class MainFilter {


  String? carFuelType;
  String? carBodyType;
  String? carTransmissionType;
  String? carEngineVolume;

  String? detailType;
}