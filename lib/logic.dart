import 'dart:math';

class EmiCalculation {
  double amount, rate, duration, temp, n, ans = 0, temp1, temp2;
  EmiCalculation({this.amount, this.rate, this.duration}) {
    n = duration * 12;
    rate = rate / 1200;
    temp = pow((1 + rate), n);
    temp1 = rate * temp;
    temp2 = (temp1) / (temp - 1);
    ans = amount * temp2;
  }
  String getEmi() {
    return ans.toInt().toString();
  }
}
