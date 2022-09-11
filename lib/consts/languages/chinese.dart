import '../rate.dart';

const int price = rate.newPrice;

class label {
  static const title = '的士車資加價換算';
  static const originalPrice = ' 原價';
  static const extraPrice = '附加費';
  static const totalPrice = '總車資';
  static const eightyFive = '總車資-85折';
  static const ninety = '總車資-9折';

  static const errorMessage = {"invalidInput": '錯誤車資, 最少車資: \$$price'};
}
