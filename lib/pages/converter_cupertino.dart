import "package:flutter/cupertino.dart";

class ConverterCupertino extends StatefulWidget {
  const ConverterCupertino({super.key});

  @override
  State<ConverterCupertino> createState() => _ConverterCupertino();
}

class _ConverterCupertino extends State<ConverterCupertino> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    // if (kDebugMode) {
    //   debugPrint("Hello World!");
    //   print("Hello World!");
    //   print(double.parse(textEditingController.text) * 81);
    // }
    final val = (double.parse(textEditingController.text) * 81)
        .toString()
        .split(".");
    final integralPart = val[0];
    final fractionalPart = val[1].substring(0, 3);
    setState(() {
      result = double.parse("$integralPart.$fractionalPart");
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: Color(0xFFFF9000),
      backgroundColor: CupertinoColors.systemGrey,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        // middle: Title("Currency Converter", color: CupertinoColors.white),
      ),
      child: Center(
        // child: ColoredBox(
        //   color: Color.fromRGBO(197, 192, 192, 0.612),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "₹ $result",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CupertinoTextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                decoration: BoxDecoration(
                  border: BoxBorder.all(),
                  borderRadius: BorderRadius.circular(5),
                  // filled: true,
                  // fillColor: Colors.white,
                ),
                placeholder: "Please enter the amount in USD.",
                placeholderStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                prefix: Icon(
                  CupertinoIcons.money_dollar_circle,
                  color: CupertinoColors.black,
                ),
                controller: textEditingController,
              ),
            ),
            CupertinoButton(
              onPressed: convert,
              // style: const ButtonStyle(
              //   backgroundColor: WidgetStatePropertyAll(Colors.black),
              //   foregroundColor: WidgetStatePropertyAll(Colors.white),
              //   padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
              // ),
              // style: TextButton.styleFrom(
              //   backgroundColor: Colors.black,
              //   foregroundColor: Colors.white,
              //   padding: EdgeInsets.all(12),
              // ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.add_circled),
                  SizedBox(width: 8),
                  Text("Convert"),
                ],
              ),
            ),
          ],
          // ),
        ),
      ),
    );
  }
}
