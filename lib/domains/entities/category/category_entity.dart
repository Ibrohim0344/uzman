class CategoryEntity {
  final String categoryName;
  bool isSelected;

  CategoryEntity({
    required this.categoryName,
    this.isSelected = false,
  });

  @override
  String toString() => """
  CategoryEntity(
    categoryName: $categoryName,
    isSelected: $isSelected,
  );
  """;
}
