import 'package:details_frontend/interfaces/drop_down.dart';

class BaseFilter {
   String? value;
}

class SelectFilter extends BaseFilter {
  List<DropdownItem> options = [];
}

class AsyncSelectFilter extends SelectFilter {
  String searchUrl;

  AsyncSelectFilter({
    required this.searchUrl
  });
}

class MainFilter {


  String? carFuelType;
  String? carBodyType;
  String? carTransmissionType;
  String? carEngineVolume;

  String? detailType;
}