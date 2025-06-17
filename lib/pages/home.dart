import 'package:chatapp/models/gasto.model.dart';
import 'package:chatapp/providers/gasto.providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gastos = context.watch<GastoProviders>().gastos;
    final total = context.watch<GastoProviders>().totalHoje;

    return Scaffold(
      appBar: AppBar(title: const Text('Gastos de Hoje')),
      body: Column(
        children: [
          Text(
            'Total: R\$ ${total.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gastos.length,
              itemBuilder: (context, index) {
                final gasto = gastos[index];
                return ListTile(
                  title: Text(gasto.categoria),
                  subtitle: Text('R\$ ${gasto.valor.toStringAsFixed(2)}'),
                  trailing: Text(gasto.data.toIso8601String()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final novo = Gasto(
            titulo: 'Exemplo',
            valor: 20.0,
            categoria: 'Alimentação',
            data: DateTime.now(),
          );
          context.read<GastoProviders>().addGasto(novo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
