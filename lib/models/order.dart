class Order {
  final List<String> items;
  final int total;
  final String paymentMethod;
  final DateTime date;

  Order({
    required this.items,
    required this.total,
    required this.paymentMethod,
    required this.date,
  });
}
