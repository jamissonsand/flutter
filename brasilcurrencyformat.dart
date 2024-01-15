// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
https://github.com/jamissonsand
// Imports custom actions
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

class brasilcurrencyformat extends StatefulWidget {
  const brasilcurrencyformat({
    Key? key,
    this.width,
    this.height,
    required this.value,
    required this.filledColor,
    required this.fontSize,
    required this.colorText,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String value;
  final Color filledColor;
  final double fontSize;
  final Color colorText;

  @override
  _BrasilcurrencyformatState createState() => _BrasilcurrencyformatState();
}

class _BrasilcurrencyformatState extends State<brasilcurrencyformat> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      keyboardType: TextInputType.number,
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: 'pt_BR',
          decimalDigits: 2,
          symbol: 'R\$ ',
          enableNegative: true,
        ),
        LengthLimitingTextInputFormatter(16),
      ],
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: widget.colorText,
        fontSize: widget.fontSize,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // ),      // Retire isso para ativar o contorno
          borderSide: BorderSide.none,
        ), // Isso retira o contono e fica só o preenchimento
        filled: true,
        fillColor: widget.filledColor,
      ),
      onChanged: (text) {
        print("valor FomartValue");
        print(text);
        FFAppState().valueFormat =
            text; // (IMPORTANTE) Crie um App Stat com o nome valueFormat, isso irá permitir recuperar o valor do input.
      },
    );
  }
}
