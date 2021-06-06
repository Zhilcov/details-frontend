class DropdownItem {
  String label;
  String value;

  DropdownItem({
    required this.label,
    required this.value
  });

  factory DropdownItem.fromJson(Map<String, dynamic> json) {
    return DropdownItem(
      value: json["value"],
      label: json["label"]
    );
  }

  static List<DropdownItem> fromJsonList(List list) {
    return list.map((item) => DropdownItem.fromJson(item)).toList();
  }
}