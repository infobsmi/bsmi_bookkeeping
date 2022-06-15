import 'package:flutter/material.dart';

import '../../enums/account_type_enums.dart';

class BookingHome extends StatefulWidget {
  /**
   * /booking
   */
  static var routeName = '/booking';

  const BookingHome({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BookingHome> createState() => _BookingHomeState();
}

class _BookingHomeState extends State<BookingHome> {

  final _formKey = GlobalKey<FormState>();

  int dropdownValue = AccountTypeEnums.expensive.id;
  int dropdownValue2 = AccountTypeEnums.assets.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(8.0),

            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('金额:'),
                  TextFormField(
                    autofocus: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Text('Debits[借方账户]:'),
                  DropdownButtonFormField<int>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: getAccountAsList(),
                  ),
                  Text('Credits[贷方账户]:'),
                  DropdownButtonFormField<int>(
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: getAccountAsList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('正在记账')),
                          );
                          //TODO 记账，写入数据库

                        }
                      },
                      child: const Text('记账'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  List<DropdownMenuItem<int>> getAccountAsList() {
    List<DropdownMenuItem<int>> ddList = [];
    AccountTypeEnums.values.forEach((element) {
      ddList.add(DropdownMenuItem(
        value: element.id,
        enabled: element.lv == 1 ? false : true,
        child: Container(
          padding: EdgeInsets.only(left: (element.lv - 1) * 20),
          child: Text(element.name),
        ),
      ));
    });

    return ddList;
  }
}
