import 'package:finance_app/pages/add_page.dart';
import 'package:finance_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../pages/statistics_page.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int indexColor = 0;
  List pages = [
    const HomePage(),
    const StatisticsPage(),
    const HomePage(),
    const StatisticsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddPage()));
          });
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        indexColor = 0;
                      });
                    },
                    child: Icon(
                      Icons.home,
                      size: 30,
                      color: indexColor == 0
                          ? const Color(0xff368983)
                          : Colors.grey,
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        indexColor = 1;
                      });
                    },
                    child: Icon(
                      Icons.bar_chart_outlined,
                      size: 30,
                      color: indexColor == 1
                          ? const Color(0xff368983)
                          : Colors.grey,
                    )),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        indexColor = 2;
                      });
                    },
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 30,
                      color: indexColor == 2
                          ? const Color(0xff368983)
                          : Colors.grey,
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        indexColor = 3;
                      });
                    },
                    child: Icon(
                      Icons.person_outlined,
                      size: 30,
                      color: indexColor == 3
                          ? const Color(0xff368983)
                          : Colors.grey,
                    )),
              ],
            ),
          )),
    );
  }
}
