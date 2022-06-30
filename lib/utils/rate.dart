import '../consts/rate.dart';

class rateUtil {
  /// @description validate if the price is valid taxi fare
  bool validatePrice(value) {
    double total = 0;
    total = double.parse((value - rate.oldPrice).toStringAsFixed(2)) % rate.beforeNineKm['oldRate'];
    if (total >= 0) {
      return true;
    } else {
      return false;
    }
  }

  /// @description calculate the new price
  num calcNewPrice(value) {
    // if price is over 9km, use new rate
    if (value <= rate.beforeNineKm['max']) {
      num km = double.parse((value - rate.oldPrice).toStringAsFixed(2)) / rate.beforeNineKm['oldRate'];
      return rate.newPrice + (km * rate.beforeNineKm['newRate']);
    } else {
      num km = double.parse((value - rate.beforeNineKm['max']).toStringAsFixed(2)) / rate.afterNineKm['oldRate'];
      print(km);
      print(rate.beforeNineKm['max']);
      print(rate.afterNineKm['max']);
      // return 0;
      return rate.afterNineKm['max'] + (km * rate.afterNineKm['newRate']);
    }
  }
}