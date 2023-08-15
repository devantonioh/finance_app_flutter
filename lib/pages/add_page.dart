import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/add_date.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final box = Hive.box<AddData>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemI;
  final TextEditingController expalinController = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amountController = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _items = [
    'Food',
    'Transfer',
    'Transport',
    'Shopping',
    'Education',
  ];
  final List<String> _itemsI = [
    'Income',
    'Expand',
  ];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(alignment: AlignmentDirectional.center, children: [
          backgroundContainer(context),
          Positioned(
            top: 120,
            child: mainContainer(),
          ),
        ]),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 550,
      width: 340,
      child: Column(children: [
        const SizedBox(height: 50),
        nameSelected(),
        const SizedBox(height: 30),
        explain(),
        const SizedBox(height: 30),
        amount(),
        const SizedBox(height: 30),
        how(),
        const SizedBox(height: 30),
        dateTime(),
        const Spacer(),
        save(),
        const SizedBox(height: 20),
      ]),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add = AddData(
          selectedItemI!,
          amountController.text,
          date,
          expalinController.text,
          selectedItem!,
        );
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff368983)),
        width: 120,
        height: 50,
        child: const Text('Save',
            style: TextStyle(
              fontFamily: 'f',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17,
            )),
      ),
    );
  }

  Container dateTime() {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5)),
        ),
        width: 300,
        child: TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (newDate == null) return;
              setState(() {
                date = newDate;
              });
            },
            child: Text('Date : ${date.year} / ${date.month} / ${date.day}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ))));
  }

  Padding how() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5)),
        ),
        child: DropdownButton<String>(
            value: selectedItemI,
            items: _itemsI
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      child: Row(children: [
                        Container(
                          width: 40,
                          child: Image.asset(
                            'assets/images/$e.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ]),
                    )))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _itemsI
                .map((e) => Row(children: [
                      Container(
                          width: 42,
                          child: Image.asset('assets/images/$e.png')),
                      const SizedBox(width: 5),
                      Text(e),
                    ]))
                .toList(),
            hint: const Text(
              'How',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: (value) {
              setState(() {
                selectedItemI = value!;
              });
            }),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amountController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'amount',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffc5c5c5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983)),
            )),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalinController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'explain',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffc5c5c5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983)),
            )),
      ),
    );
  }

  Padding nameSelected() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5)),
        ),
        child: DropdownButton<String>(
            value: selectedItem,
            items: _items
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      child: Row(children: [
                        Container(
                          width: 40,
                          child: Image.asset(
                            'assets/images/$e.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ]),
                    )))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _items
                .map((e) => Row(children: [
                      Container(
                          width: 42,
                          child: Image.asset('assets/images/$e.png')),
                      const SizedBox(width: 5),
                      Text(e),
                    ]))
                .toList(),
            hint: const Text(
              'Name',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
            }),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Column(children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Text('Adding',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  const Icon(
                    Icons.attach_file_outlined,
                    color: Colors.white,
                  ),
                ]),
          )
        ]),
      )
    ]);
  }
}
