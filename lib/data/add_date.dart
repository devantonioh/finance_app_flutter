import 'package:hive/hive.dart';

part 'add_date.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String explain;
  @HiveField(2)
  final String amount;
  @HiveField(3)
  final String IN;
  @HiveField(4)
  final DateTime dateTime;

  AddData(
    this.IN,
    this.amount,
    this.dateTime,
    this.explain,
    this.name,
  );
}
