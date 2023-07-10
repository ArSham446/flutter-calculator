import 'package:calculator/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'AC',
      'C',
      '%',
      '/',
      '7',
      '8',
      '9',
      '*',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      '='
    ];
    List<String> lisT = [
      'AC',
      '1',
      '2',
      '3',
      '*',
      '/',
      '4',
      '5',
      '6',
      '7',
      '+',
      '-',
      '8',
      '9',
      '0',
      '.',
      '%',
      'C',
      '='
    ];
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Calculator'),
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[300],
              child: Column(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Consumer<CalculationsProvider>(
                            builder: (context, calculationsProvider, child) =>
                                Column(
                              children: [
                                Text(
                                  calculationsProvider.history,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  calculationsProvider.result,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        19,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: list[index] == '=' ? 149 : 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Consumer<CalculationsProvider>(
                                builder:
                                    (context, calculationsProvider, child) =>
                                        ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: list[index] == '='
                                        ? Colors.blue[300]
                                        : list[index] == 'AC' ||
                                                list[index] == 'C' ||
                                                list[index] == '%'
                                            ? Colors.amber[300]
                                            : list[index] == '/' ||
                                                    list[index] == '*' ||
                                                    list[index] == '-' ||
                                                    list[index] == '+'
                                                ? const Color.fromARGB(
                                                    255, 4, 241, 151)
                                                : Colors.white,
                                    foregroundColor: list[index] == 'AC' ||
                                            list[index] == 'C' ||
                                            list[index] == '%'
                                        ? Colors.green
                                        : list[index] == '/' ||
                                                list[index] == '*' ||
                                                list[index] == '-' ||
                                                list[index] == '+'
                                            ? Colors.red
                                            : Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: calculationsProvider.list[index],
                                  child: Text(
                                    list[index],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
                ],
              ),
            ))
        //landscape
        : Scaffold(
            appBar: AppBar(
              title: const Text('Calculator'),
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Consumer<CalculationsProvider>(
                            builder: (context, calculationsProvider, child) =>
                                Column(
                              children: [
                                Text(
                                  calculationsProvider.history,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  calculationsProvider.result,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        19,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: lisT[index] == '=' ? 344 : 49,
                              height: 49,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Consumer<CalculationsProvider>(
                                builder:
                                    (context, calculationsProvider, child) =>
                                        ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lisT[index] == '='
                                        ? Colors.blue[300]
                                        : lisT[index] == 'AC' ||
                                                lisT[index] == 'C' ||
                                                lisT[index] == '%'
                                            ? Colors.amber[300]
                                            : lisT[index] == '/' ||
                                                    lisT[index] == '*' ||
                                                    lisT[index] == '-' ||
                                                    lisT[index] == '+'
                                                ? const Color.fromARGB(
                                                    255, 4, 241, 151)
                                                : Colors.white,
                                    foregroundColor: lisT[index] == 'AC' ||
                                            lisT[index] == 'C' ||
                                            lisT[index] == '%'
                                        ? Colors.green
                                        : lisT[index] == '/' ||
                                                lisT[index] == '*' ||
                                                lisT[index] == '-' ||
                                                lisT[index] == '+'
                                            ? Colors.red
                                            : Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: calculationsProvider.list[index],
                                  child: Text(
                                    lisT[index],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
                ],
              ),
            ));
  }
}
