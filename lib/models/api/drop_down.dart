import 'package:json_annotation/json_annotation.dart';

part 'drop_down.g.dart';

@JsonSerializable()
class DropdownItem {
  @JsonKey(name: "label") final String label;
  @JsonKey(name: "value") final String value;

  DropdownItem({required this.label, required this.value});
  factory DropdownItem.fromJson(Map<String, dynamic> json) => _$DropdownItemFromJson(json);
  Map<String, dynamic> toJson() => _$DropdownItemToJson(this);

  // factory DropdownItem.fromJson(Map<String, dynamic> json) {
  //   return DropdownItem(
  //     value: json["value"].toString(),
  //     label: json["label"].toString()
  //   );
  // }
  //
  static List<DropdownItem> fromJsonList(List list) {

    print(list.map((el) {
      return DropdownItem(label: el['label'], value: el['value']);
    }));
    return list.map((item) => DropdownItem.fromJson(item)).toList();
  }

  String toString() {
    return 'DropdownItem: {label: ${this.label}, value: ${this.value}}';
  }
}