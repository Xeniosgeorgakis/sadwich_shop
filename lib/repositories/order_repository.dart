class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;

  OrderRepository({required this.maxQuantity});

  int get quantity => _quantity;

  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;

  void increment() {
    if (canIncrement) {
      _quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      _quantity--;
    }
  }
}

class PricingRepository {
  final int sixInchPrice; // in pounds
  final int footlongPrice; // in pounds

  PricingRepository({this.sixInchPrice = 7, this.footlongPrice = 11});

  /// Calculate total price in whole pounds for the given quantity and size.
  int totalPrice({required int quantity, required bool isFootlong}) {
    final unit = isFootlong ? footlongPrice : sixInchPrice;
    return unit * quantity;
  }
}