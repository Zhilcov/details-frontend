import 'package:details_frontend/models/api/drop_down.dart';
import 'package:details_frontend/models/api/api_response.dart';
import 'package:details_frontend/utils/device/response_handler.dart';

import 'base_api_service.dart';

class CarBrandApiService extends BaseApi {
  CarBrandApiService();

  Future<APIResponse<List<DropdownItem>>> getBrandsList() async {
    final res = await this.get("car/get-car-brands-list");

    var handledRes = ResponseStatusHandler.parse<List>(res);
    return APIResponse<List<DropdownItem>>(
        data: DropdownItem.fromJsonList(handledRes.data),
        success: handledRes.success,
        message: handledRes.message
    );
  }
}