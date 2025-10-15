import 'package:my_first_project/EX-4_Shop-Management/data/product_data.dart';
import 'package:my_first_project/EX-4_Shop-Management/domain/address.dart';
import 'package:my_first_project/EX-4_Shop-Management/domain/order.dart';
import 'package:my_first_project/EX-4_Shop-Management/domain/product.dart';

import 'package:test/test.dart';

void main () {
  // To avoid confusion when running the entire test and each test.
  // So clonning the product in every test case to make sure it does not share the available products info with other test cases.
  Map<int, Product> cloneAvailableProducts() {
    return availableProducts.map(
      (key, product) => MapEntry(
        key,
        Product(
          productId: product.productId,
          productName: product.productName,
          productPrice: product.productPrice,
          quantity: product.quantity,
        ),
      ),
    );
  }
  // display normal product
  for (var product in availableProducts.values) {
      print(product);
  }
  test('Adding non-existing product ID to order (delivery)', () {
    Map<int, Product> products = cloneAvailableProducts();
    var address = Address(street: "123 Riverside Blvd", city: "Phnom Penh", zipCode: "CHICK-1234");
    Order order = Order.delivery(availableProducts: products, address: address);
    expect(() => order.addOrderItem(10, 4), throwsA(isA<Exception>()));
  });

  test('Adding existing product ID to order and check the product deduction (Delivery type)', () {
    Map<int, Product> products = cloneAvailableProducts();
    var address = Address(street: "123 Riverside Blvd", city: "Phnom Penh", zipCode: "CHICK-1234");
    Order order = Order.delivery(availableProducts: products, address: address);
    order.addOrderItem(1, 4);
    var item = order.items[1]!;
    expect(item.orderQuantity, equals(4));
    expect(item.subTotal, equals(8));
    expect(products[1]!.quantity, equals(6));
    expect(order.total, equals(8));
  });

  test('Adding existing orderItem', () {
    Map<int, Product> products = cloneAvailableProducts();
    var address = Address(street: "123 Riverside Blvd", city: "Phnom Penh", zipCode: "CHICK-1234");
    Order order = Order.delivery(availableProducts: products, address: address);
    order.addOrderItem(1, 4);
    order.addOrderItem(1, 1);
    var item = order.items[1]!;
    expect(item.subTotal, equals(10));
    expect(products[1]!.quantity, equals(5));
    expect(order.total, equals(10));
    // There should be only 1 item with the productId 1 inside the order 
    expect(order.items.length, equals(1));
  });

  test('Adding multiple products', () {
    Map<int, Product> products = cloneAvailableProducts();
    Order order = Order.pickup(availableProducts: products);
    order.addOrderItem(1, 1);
    order.addOrderItem(2, 1);
    // When accessing the value of map by key it will return as nullable
    var item1 = order.items[1]!;
    var item2 = order.items[2]!;

    // check the productID 1
    expect(item1.subTotal, equals(2));
    expect(products[1]!.quantity, equals(9));

    // check the productID 2
    expect(item2.subTotal, equals(1.5));
    expect(products[2]!.quantity, equals(7));
    
    expect(order.total, equals(3.5));
    // There should be only 1 item with the productId 1 inside the order 
    expect(order.items.length, equals(2));
  });

  test('Adding product with 0 quantity', () {
    Map<int, Product> products = cloneAvailableProducts();
    Order order = Order.pickup(availableProducts: products);
    expect(() => order.addOrderItem(1, 0), throwsA(isA<Exception>()));
  });

  test('Adding product with negative number', () {
    Map<int, Product> products = cloneAvailableProducts();
    Order order = Order.pickup(availableProducts: products);
    expect(() => order.addOrderItem(1, -1), throwsA(isA<Exception>()));
  });



}