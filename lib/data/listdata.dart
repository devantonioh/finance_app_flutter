import 'package:finance_app/data/1.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'upwork.png';
  upwork.buy = false;

  money starbucks = money();
  starbucks.name = 'starbucks';
  starbucks.fee = '15';
  starbucks.time = 'today';
  starbucks.image = 'starbucks.png';
  starbucks.buy = true;

  money trasfer = money();
  trasfer.name = 'transfer for sam';
  trasfer.fee = '100';
  trasfer.time = 'june 30, 2023';
  trasfer.image = 'cra.png';
  trasfer.buy = true;
  money amazon = money();
  amazon.name = 'amazon';
  amazon.fee = '88.90';
  amazon.time = 'july 15, 2023';
  amazon.image = 'amazon.png';
  amazon.buy = true;

  return [
    upwork,
    starbucks,
    trasfer,
    amazon,
    upwork,
    starbucks,
    amazon,
    trasfer
  ];
}
