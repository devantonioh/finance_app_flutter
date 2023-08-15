import 'package:finance_app/data/1.dart';

List<money> geterTop() {
  money snapFood = money();
  snapFood.name = 'Starbucks';
  snapFood.fee = '\$ 100';
  snapFood.time = 'jan 30, 2023';
  snapFood.image = 'starbucks.png';
  snapFood.buy = true;

  money snap = money();
  snap.name = 'Transfer';
  snap.fee = '- \$ 60';
  snap.time = 'today';
  snap.image = 'cra.png';
  snap.buy = true;

  return [snapFood, snap];
}
