import 'address.dart';
import 'orderItem.dart';
import 'product.dart';

enum DeliveryType {delivery, pickup}

class Order {
  final Map<int, OrderItem> _items = {};
  final DeliveryType _deliveryType;
  final Address? _address;

  Order.pickup() 
      : _deliveryType = DeliveryType.pickup,
        _address = null;

  Order.delivery({required Address address})
      : _deliveryType = DeliveryType.delivery,
        _address = address;

  /// Adds a product to the order
  void addOrderItem(Product product, int orderQuantity) {
    if (orderQuantity <= 0) {
      throw Exception("Order quantity must be greater than 0.");
    }

    var existingItem = _items[product.productId];
    if (existingItem != null) {
      existingItem.addQuantity(orderQuantity);
      product.deductStock(orderQuantity);
    } else {
      product.deductStock(orderQuantity);
      _items[product.productId] =
          OrderItem(product: product, orderQuantity: orderQuantity);
    }
  }

  Map<int, OrderItem> get items => this._items;

  double get total {
    double total = 0;
    _items.forEach((key, item) {
      total += item.subTotal;
    });
    return total;
  }

  void printReceipt() {
    if(_items.isNotEmpty) {
      print('--------------- RECEIPT ---------------');
      print('Order Type: ${_deliveryType.name}');
      if (_address != null) {
        print('Delivery Address: ${_address!.street}, ${_address!.city}, ${_address!.zipCode}');
      }

      print('\nItems:');
      print('Product      Qty   Unit Price   Subtotal');
      print('----------------------------------------');
      _items.forEach((key, item) {
        final name = item.product.productName.padRight(13);
        final qty = item.orderQuantity.toString().padRight(6);
        final unitPrice = item.product.productPrice.toString().padRight(12);
        final subtotal = item.subTotal.toString();
        print('$name$qty\$${unitPrice}\$${subtotal}');
      });

      print('\nTotal: \$${total.toString()}');
      print('----------------------------------------');
    }
    }


}