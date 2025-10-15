import 'data/product_data.dart';
import 'domain/address.dart';
import 'domain/order.dart';


void main () {
  for (var product in availableProducts.values) {
      print(product);
    }
  var address = Address(street: "123 Riverside Blvd", city: "Phnom Penh", zipCode: "123456");
  Order order = Order.delivery(address: address);
  var p1 = availableProducts[1]!;
  var p2 = availableProducts[2]!;

  order.addOrderItem(p1, 4);
  order.addOrderItem(p2, 1);

  order.printReceipt();

  for (var product in availableProducts.values) {
    print(product);
  }

}