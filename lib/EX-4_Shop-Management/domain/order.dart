import 'address.dart';
import 'orderItem.dart';
import 'product.dart';

enum DeliveryType {delivery, pickup}

class Order {
  final Map<int, Product> _availableProducts;
  final Map<int, OrderItem> _items = {};
  final DeliveryType _deliveryType;
  final Address? _address;


  Order.pickup({required Map<int, Product> availableProducts}) : 
    _availableProducts = availableProducts,
    _deliveryType = DeliveryType.pickup,
    _address = null;

  Order.delivery({required Map<int, Product> availableProducts, required Address address}) :
    _availableProducts = availableProducts,
    _deliveryType = DeliveryType.delivery,
    _address = address;

  void addOrderItem(int productId, int orderQuantity) {
    var existingProduct = _availableProducts[productId];
    // Check if product exists.
    if (productId <= 0 || existingProduct == null) {
      throw Exception("Product with ID $productId does not exist.");
    }
    // Check if product already in order
    var existingItem = _items[productId];
    if (existingItem != null) {
      existingItem.addQuantity(orderQuantity);
      existingItem.product.deductStock(orderQuantity);
    } else {
      // Add new order item into order
      existingProduct.deductStock(orderQuantity);
      _items[productId] = OrderItem(product: existingProduct, orderQuantity: orderQuantity);
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