class SupplementModle {
  String? imageName;
  bool? isPrescription;
  String? name;
  String? tablet;
  String? amount;
  List? categories;

  SupplementModle({
    required this.imageName,
    this.isPrescription,
    required this.name,
    required this.tablet,
    required this.amount,
    required this.categories,
  });
}
