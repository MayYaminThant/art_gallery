class Category {
  final String categoryId;
  final String categoryName;
  final String? createdDate;
  final String? modifiedDate;

  Category({
    required this.categoryId,
    required this.categoryName,
    this.createdDate,
    this.modifiedDate,
  });
}
