import 'package:calculator/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final buttonList = isPortrait ? _portraitButtonList : _landscapeButtonList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[300],
        child: isPortrait
            ? _buildPortraitLayout(buttonList)
            : _buildLandscapeLayout(buttonList),
      ),
    );
  }

  Widget _buildPortraitLayout(List<String> buttonList) {
    return Column(
      children: [
        _buildDisplay(),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                buttonList.length,
                (index) => _buildButton(buttonList[index], buttonList),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(List<String> buttonList) {
    return Row(
      children: [
        _buildDisplay(),
        const SizedBox(width: 30),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                buttonList.length,
                (index) => _buildButton(buttonList[index], buttonList),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDisplay() {
    return Container(
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
              builder: (context, calculationsProvider, child) => Column(
                children: [
                  Text(
                    calculationsProvider.firstNumber +
                        calculationsProvider.operator +
                        calculationsProvider.secondNumber,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    calculationsProvider.result,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, List<String> buttonList) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: label == '=' ? 149 : 70,
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
          builder: (context, calculationsProvider, child) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: label == '='
                  ? Colors.blue[300]
                  : label == 'AC' || label == 'C' || label == '%'
                      ? Colors.amber[300]
                      : label == '/' ||
                              label == '*' ||
                              label == '-' ||
                              label == '+'
                          ? const Color.fromARGB(255, 4, 241, 151)
                          : Colors.white,
              foregroundColor: label == 'AC' || label == 'C' || label == '%'
                  ? Colors.green
                  : label == '/' || label == '*' || label == '-' || label == '+'
                      ? Colors.red
                      : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: calculationsProvider.list[buttonList.indexOf(label)],
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  static const _portraitButtonList = [
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
    '=',
  ];

  static const _landscapeButtonList = [
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
    '=',
  ];
}
