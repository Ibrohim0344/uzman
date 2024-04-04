class DiscountEntity {
  final int percent;
  final String title;
  final String description;

  DiscountEntity({
    required this.percent,
    required this.title,
    this.description =
        "Har biriga chegirma oling buyurtma, faqat bugun amal qiladi",
  });
}
