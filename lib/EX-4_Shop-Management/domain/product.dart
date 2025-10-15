
class Product {
  final int _productId;
  final String _productName;
  final double _productPrice;
  int _quantity;

  Product({required int productId, required String productName, required double productPrice, required int quantity}) : 
    _productId = productId,
    _productName = productName,
    _productPrice = productPrice,
    _quantity = quantity;

  int get productId => this._productId;
  String get productName => this._productName;
  double get productPrice => this._productPrice;
  int get quantity => this._quantity;

  void deductStock (int orderQuantity) {
    if (orderQuantity <= 0) {
      throw Exception("Quantity must be greater than 0.");
    } else if (orderQuantity > this._quantity) {
      throw Exception("Not enough stock for ${_productName}");
    }
    _quantity -= orderQuantity;
  }
  
  @override
  String toString() {
    return "- ID: $_productId, Name: $_productName, Price: $_productPrice, Quantity in stock: $_quantity";
  }
}