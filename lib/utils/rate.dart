import '../consts/rate.dart';

class RateUtil {
  /// @description validate if the price is valid taxi fare
  bool validatePrice(value) {
    if (value >= rate.newPrice) {
      return true;
    } else {
      return false;
    }
  }
}
