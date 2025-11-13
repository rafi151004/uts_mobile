import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _output = "0";
  String _currentOperation = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  bool _operandJustPressed = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // Tombol HAPUS/Clear
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
        _currentOperation = "";
        _operandJustPressed = false;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        // Operasi Sederhana
        _num1 = double.parse(_output);
        _operand = buttonText;
        _currentOperation += buttonText;
        _operandJustPressed = true;
      } else if (buttonText == "√") {
        // Operasi Akar Kuadrat
        _num1 = double.parse(_output);
        // PERBAIKAN: Baris 41 di sini, diperbaiki menjadi:
        _currentOperation = "√($_num1)";
        _output = sqrt(_num1).toString();
        _num1 = double.parse(_output);
        _operand = "";
        _operandJustPressed = false;
      } else if (buttonText == "x²") {
        // Operasi Kuadrat
        _num1 = double.parse(_output);
        // PERBAIKAN: Baris 49 di sini, diperbaiki menjadi:
        _currentOperation = "($_num1)²";
        _output = (pow(_num1, 2)).toString();
        _num1 = double.parse(_output);
        _operand = "";
        _operandJustPressed = false;
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += buttonText;
        }
      } else if (buttonText == "=") {
        if (_operand.isNotEmpty && !_operandJustPressed) {
          _num2 = double.parse(_output);
          String finalResult = _calculate();
          _currentOperation += _num2.toString();
          _output = finalResult;
          _num1 = double.parse(finalResult);
          _operand = "";
          _operandJustPressed = false;
        }
      } else {
        if (_output == "0" || _operandJustPressed) {
          _output = buttonText;
          _currentOperation = (_operandJustPressed && _operand.isNotEmpty)
              ? _num1.toString() + _operand + buttonText
              : buttonText;
          _operandJustPressed = false;
        } else {
          _output += buttonText;
          _currentOperation += buttonText;
        }
      }
    });
  }

  String _calculate() {
    double result = 0;
    switch (_operand) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "×":
        result = _num1 * _num2;
        break;
      case "÷":
        result = _num1 / _num2;
        break;
      default:
        return _output;
    }
    // Format agar tidak ada .0 jika hasilnya bilangan bulat
    return result.toString().endsWith('.0')
        ? result.toStringAsFixed(0)
        : result.toString();
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Display Input dan Hasil
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _currentOperation.isEmpty ? "0" : _currentOperation,
            style: const TextStyle(fontSize: 24.0, color: Colors.grey),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _output,
            style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),

        // Tombol-tombol Kalkulator
        Column(
          children: [
            Row(
              children: <Widget>[
                buildButton("C", Colors.red.shade300, Colors.white), // Hapus
                buildButton("√", Colors.indigo.shade100, Colors.indigo), // Akar Kuadrat
                buildButton("x²", Colors.indigo.shade100, Colors.indigo), // Kuadrat
                buildButton("÷", Colors.indigo, Colors.white), // Bagi
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("7", Colors.grey.shade200, Colors.black),
                buildButton("8", Colors.grey.shade200, Colors.black),
                buildButton("9", Colors.grey.shade200, Colors.black),
                buildButton("×", Colors.indigo, Colors.white), // Kali
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("4", Colors.grey.shade200, Colors.black),
                buildButton("5", Colors.grey.shade200, Colors.black),
                buildButton("6", Colors.grey.shade200, Colors.black),
                buildButton("-", Colors.indigo, Colors.white), // Kurang
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("1", Colors.grey.shade200, Colors.black),
                buildButton("2", Colors.grey.shade200, Colors.black),
                buildButton("3", Colors.grey.shade200, Colors.black),
                buildButton("+", Colors.indigo, Colors.white), // Tambah
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("0", Colors.grey.shade200, Colors.black),
                buildButton(".", Colors.grey.shade200, Colors.black),
                buildButton("=", Colors.green, Colors.white),
              ],
            ),
          ],
        ),
      ],
    );
  }
}