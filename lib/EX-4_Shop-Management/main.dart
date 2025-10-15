import 'data/product_data.dart';
import 'domain/address.dart';
import 'domain/order.dart';


void main () {
  for (var product in availableProducts.values) {
      print(product);
    }
  var address = Address(street: "123 Riverside Blvd", city: "Phnom Penh", zipCode: "123456");
  Order order = Order.delivery(availableProducts: availableProducts, address: address);
  order.addOrderItem(1, 4);
  order.addOrderItem(1, 2);

  order.printReceipt();

  for (var product in availableProducts.values) {
    print(product);
  }

}