import 'product.dart';

class OrderItem {
  final Product _product;
  int _orderQuantity;

  OrderItem({required Product product, required int orderQuantity}) :
    _product = product,
    _orderQuantity =orderQuantity;

  double get subTotal => _orderQuantity * _product.productPrice;

  void addQuantity (int additionalQuantity) {
    if (additionalQuantity <= 0) {
      throw Exception('Quantity to add must be greater than zero');
    }
    _orderQuantity += additionalQuantity;
  }

  Product get product => this._product;
  int get orderQuantity => this._orderQuantity;

}