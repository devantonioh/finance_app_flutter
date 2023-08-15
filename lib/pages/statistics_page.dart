import 'package:finance_app/data/add_date.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

import '../data/utility.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsPageState extends State<StatisticsPage> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<AddData> a = [];
  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            a = f[value];
            return custom();
          }),
    ));
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...List.generate(
                        4,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexColor = index;
                                kj.value = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: indexColor == index
                                    ? const Color.fromARGB(255, 47, 125, 121)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: indexColor == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Expense',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey,
                              )),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Chart(indexx: indexColor),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: const [
                    Text('Top Spending',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/${a[index].name}.png',
                    height: 40),
              ),
              title: Text(a[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  )),
              subtitle: Text(
                  '${a[index].dateTime.weekday - 1}  ${a[index].dateTime.year} - ${a[index].dateTime.day}- ${a[index].dateTime.month}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              trailing: Text(a[index].amount,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: a[index].IN == 'Income' ? Colors.green : Colors.red,
                  )),
            );
          },
          childCount: a.length,
        ))
      ],
    );
  }
}
