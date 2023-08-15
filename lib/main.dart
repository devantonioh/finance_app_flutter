import 'package:finance_app/widgets/botton_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/add_date.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddDataAdapter());
  await Hive.openBox<AddData>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}
