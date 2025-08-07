import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalcPantalla(),
      theme: ThemeData.dark(),
    );
  }
}

class CalcPantalla extends StatefulWidget {
  const CalcPantalla({super.key});

  @override
  _CalcPantallaState createState() => _CalcPantallaState();
}

class _CalcPantallaState extends State<CalcPantalla> {
  String _pantalla = '0';
  double _numeroUno = 0;
  String _operador = '';
  bool _isOperadorPressed = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _pantalla = '0';
        _numeroUno = 0;
        _operador = '';
        _isOperadorPressed = false;
      } else if (buttonText == '⌫') {
        if (_pantalla.length == 1) {
          _pantalla = '0';
        } else {
          _pantalla = _pantalla.substring(0, _pantalla.length - 1);
        }
      } else if (buttonText == '%') {
        double number = double.parse(_pantalla);
        _pantalla = (number / 100).toString();
      } else if (['+', '−', '×', '÷'].contains(buttonText)) {
        _numeroUno = double.parse(_pantalla);
        _operador = buttonText;
        _isOperadorPressed = true;
      } else if (buttonText == '=') {
        double numeroDos = double.parse(_pantalla);
        double result = 0;
        switch (_operador) {
          case '+':
            result = _numeroUno + numeroDos;
            break;
          case '−':
            result = _numeroUno - numeroDos;
            break;
          case '×':
            result = _numeroUno * numeroDos;
            break;
          case '÷':
            result = numeroDos != 0 ? _numeroUno / numeroDos : double.nan;
            break;
        }
        _pantalla = result.toStringAsFixed(2).replaceAll('.00', '');
        _operador = '';
        _isOperadorPressed = false;
      } else {
        if (_pantalla == '0' || _isOperadorPressed) {
          _pantalla = buttonText;
          _isOperadorPressed = false;
        } else {
          _pantalla += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String text, Color color, {double fontSize = 24}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30),
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Pantalla de la calculadora
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  _pantalla,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Botones de la calculadora
            Expanded(
              flex: 5, // Para utilizar más espacio vertical
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuye las filas uniformemente
                children: [
                  Row(
                    children: [
                      _buildButton('AC', Colors.blue[600]!),
                      _buildButton('⌫', Colors.blue[600]!),
                      _buildButton('%', Colors.blue[600]!),
                      _buildButton('÷', Colors.blue[600]!),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('7', Colors.grey[800]!),
                      _buildButton('8', Colors.grey[800]!),
                      _buildButton('9', Colors.grey[800]!),
                      _buildButton('×', Colors.blue[600]!),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('4', Colors.grey[800]!),
                      _buildButton('5', Colors.grey[800]!),
                      _buildButton('6', Colors.grey[800]!),
                      _buildButton('−', Colors.blue[600]!),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('1', Colors.grey[800]!),
                      _buildButton('2', Colors.grey[800]!),
                      _buildButton('3', Colors.grey[800]!),
                      _buildButton('+', Colors.blue[600]!),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 125), // Tamaño de espacio abajo a la izquierda
                      _buildButton('0', Colors.grey[800]!, fontSize: 24),
                      _buildButton('.', Colors.grey[800]!),
                      _buildButton('=', Colors.blue[900]!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
