import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'product_provider.dart';

class RemoteConfigProvider extends ChangeNotifier {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> fetchAndActivateConfig(ProductProvider productProvider) async {
    try {
      var data = await _remoteConfig.fetchAndActivate();
      bool showDiscountedPrice = _remoteConfig.getBool('showDiscountedPrice');
      productProvider.setPriceDisplay(showDiscountedPrice);
                  productProvider.fetchProducts();

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
