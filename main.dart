import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0; // Variável para armazenar o valor do contador

  bool get isEmpty => _counter == 0; // Verifica se o contador está vazio
  bool get isFull => _counter == 20; // Verifica se o contador atingiu o limite

  void _decrementar() {
    if (!isEmpty) {
      setState(() {
        _counter--;
      });
    }
  }

  void _incrementar() {
    if (!isFull) {
      setState(() {
        _counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isFull ? Colors.red : Colors.yellow, // Altera a cor conforme o estado
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull
                  ? 'Lotado!'
                  : 'Pode Entrar!!', // Exibe mensagem condicional
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter', // Mostra o valor do contador
              style: const TextStyle(fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(32), // Espaçamento em volta
              child: Text(
                'Bem-vindo ao sistema!',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza os botões
              children: [
                TextButton(
                  onPressed: _decrementar,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(100, 50), // Tamanho fixo do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10), // Raio dos cantos
                      ),
                    ),
                  ),
                  child: const Text(
                    'sair',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16), // Espaço entre os botões
                TextButton(
                  onPressed: _incrementar,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size(100, 50), // Tamanho fixo do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10), // Raio dos cantos
                      ),
                    ),
                  ),
                  child: const Text(
                    'entrou',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
