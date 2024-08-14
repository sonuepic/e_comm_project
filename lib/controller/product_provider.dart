import 'package:e_comm_project/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _showDiscountedPrice = false;

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = jsonDecode(response.body)['products'] as List;
      _products = data.map((item) => Product.fromJson(item)).toList();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void setPriceDisplay(bool showDiscounted) {
    _showDiscountedPrice = showDiscounted;
    notifyListeners();
  }

  double? getPrice(Product product) {
    return _showDiscountedPrice
        ? product.price * (1 - product.discountPercentage / 100)
        : product.price;
  }
}
