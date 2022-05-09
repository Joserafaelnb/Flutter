import 'package:flutter/material.dart';

void main() =>
    runApp(
      BytebankApp(),
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('transferências'),
      ),
      body: Column(
        children: [
          ItensTransferencias('100.00', '1000'),
          ItensTransferencias('200.00 ', '2000'),
          ItensTransferencias('300.00', '3000'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
        Editor(
        controlador: _controladorCampoNumeroConta,
        rotulo: 'Número da conta',
        dica: '0000',
      ),
      Editor(
      controlador: _controladorCampoValor,
      rotulo: 'Valor',
      dica: '0.00',
      icone: Icons.monetization_on,
    ),
      _criaTransferencia(),


    ]

      ),

    );
  }

  ElevatedButton _criaTransferencia() {
    return ElevatedButton(
  onPressed: () {
  debugPrint('clicou no confirmar');

  final int? numeroconta =
  int.tryParse(_controladorCampoNumeroConta.text);
  final double? valor =
  double.tryParse(_controladorCampoValor.text);
  if (_controladorCampoValor != null &&
  _controladorCampoNumeroConta != null) {
  final transferenciaCriada = Transferencia(numeroconta, valor);
  debugPrint('$transferenciaCriada');
  }
  },
  child: Text('Confirmar'),
  );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class Transferencia {
  final double? valor;
  final int? numeroConta;

  Transferencia(this.numeroConta, this.valor);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItensTransferencias extends StatelessWidget {
  final String valor;
  final String numeroConta;

  ItensTransferencias(this.valor, this.numeroConta);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(numeroConta),
      ),
    );
  }
}
