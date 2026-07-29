import "package:flutter/material.dart";

class ConverterMaterial extends StatelessWidget {
  const ConverterMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

    const customBorder = OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return Scaffold(
      // backgroundColor: Color(0xFFFF9000),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Text("Currency Converter"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 32,
        ),
        centerTitle: false,
        // leading: Icon(
        //   Icons.currency_exchange_sharp,
        //   color: Colors.yellow,
        //   size: 32,
        // ),
      ),
      body: Center(
        // child: ColoredBox(
        //   color: Color.fromRGBO(197, 192, 192, 0.612),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              result.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                decoration: InputDecoration(
                  // labelText: "Please enter the amount in USD.",
                  // label: Text(
                  //   "Please enter the amount in USD.",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // helperText: "Please enter the amount in USD.",
                  hintText: "Please enter the amount in USD.",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: customBorder,
                ),
                onSubmitted: (value) {
                  print(value);
                },
                controller: textEditingController,
              ),
            ),
            TextButton(
              onPressed: () {
                // if (kDebugMode) {
                //   debugPrint("Hello World!");
                //   print("Hello World!");
                //   print(double.parse(textEditingController.text) * 81);
                // }
                result = double.parse(textEditingController.text) * 81;
                print(result);
              },
              // style: const ButtonStyle(
              //   backgroundColor: WidgetStatePropertyAll(Colors.black),
              //   foregroundColor: WidgetStatePropertyAll(Colors.white),
              //   padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
              // ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.currency_exchange),
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
