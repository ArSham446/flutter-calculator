import 'package:calculator/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    // Select the appropriate button list based on the device orientation
    final buttonList = isPortrait ? _portraitButtonList : _landscapeButtonList;
    // Check if the device is in portrait or landscape mode

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[300],
        child: isPortrait
            ? _buildPortraitLayout(context, buttonList)
            : _buildLandscapeLayout(context, buttonList),
      ),
    );
  }

  // Function to build the layout for portrait mode
  Widget _buildPortraitLayout(BuildContext context, List<String> buttonList) {
    return Column(
      children: [
        _buildDisplay(context),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                buttonList.length,
                (index) => _buildButton(context, buttonList[index], buttonList),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to build the layout for landscape mode
  Widget _buildLandscapeLayout(BuildContext context, List<String> buttonList) {
    return Row(
      children: [
        _buildDisplay(context),
        const SizedBox(width: 30),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                buttonList.length,
                (index) => _buildButton(context, buttonList[index], buttonList),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to build the display area
  Widget _buildDisplay(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPortrait ? 160 : double.infinity,
      width: isPortrait ? double.infinity : 250,
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
            // Display the calculation history and result
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

  // Function to build the calculator buttons
  Widget _buildButton(
      BuildContext context, String label, List<String> buttonList) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: isPortrait
            ? label == '='
                ? 149
                : 70
            : label == '='
                ? 344
                : 49,
        height: isPortrait ? 70 : 49,
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
            // Call the appropriate function when a button is pressed
            onPressed: isPortrait
                ? calculationsProvider.list[buttonList.indexOf(label)]
                : calculationsProvider.lisT[buttonList.indexOf(label)],
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  // List of buttons for portrait mode
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

  // List of buttons for landscape mode
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
