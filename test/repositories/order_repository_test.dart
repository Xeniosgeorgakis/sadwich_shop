import 'package:flutter_test/flutter_test.dart';
import 'package:sadwich_shop/repositories/order_repository.dart';

void main() {
  group('OrderRepository', () {
    test('initial quantity should be 0', () {
      final repository = OrderRepository(maxQuantity: 5);
      expect(repository.quantity, 0);
    });

    test('increment should increase quantity by 1', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.increment();
      expect(repository.quantity, 1);
    });

    test('decrement should decrease quantity by 1', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.increment();
      repository.decrement();
      expect(repository.quantity, 0);
    });

    test('quantity should not exceed maxQuantity', () {
      final repository = OrderRepository(maxQuantity: 2);
      repository.increment();
      repository.increment();
      repository.increment();
      expect(repository.quantity, 2);
    });

    test('quantity should not go below 0', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.decrement();
      expect(repository.quantity, 0);
    });
  });

  group('PricingRepository', () {
    test('zero quantity should cost 0', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(quantity: 0, isFootlong: false), 0);
      expect(repo.totalPrice(quantity: 0, isFootlong: true), 0);
    });

    test('six-inch price is applied correctly', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(quantity: 1, isFootlong: false), 7);
      expect(repo.totalPrice(quantity: 3, isFootlong: false), 21);
    });

    test('footlong price is applied correctly', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(quantity: 1, isFootlong: true), 11);
      expect(repo.totalPrice(quantity: 2, isFootlong: true), 22);
    });

    test('custom prices via constructor', () {
      final repo = PricingRepository(sixInchPrice: 5, footlongPrice: 9);
      expect(repo.totalPrice(quantity: 2, isFootlong: false), 10);
      expect(repo.totalPrice(quantity: 2, isFootlong: true), 18);
    });
  });
}
