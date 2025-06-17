import 'package:chatapp/models/gasto.model.dart';
import 'package:flutter/material.dart';

class GastoProviders with ChangeNotifier {
  List<Gasto> _gastos = [];

  List<Gasto> get gastos => _gastos;

  void addGasto(Gasto gasto) {
    _gastos.add(gasto);
    notifyListeners();
  } 

  void removeGasto(String gasto) {
    _gastos.remove(gasto);
    notifyListeners();
  }

  void clearGastos() {
    _gastos.clear();
    notifyListeners();
  }

  double get totalHoje {
    final hoje = DateTime.now();
    return _gastos
        .where((g) =>
            g.data.day == hoje.day &&
            g.data.month == hoje.month &&
            g.data.year == hoje.year)
        .fold(0.0, (soma, g) => soma + g.valor);
  }
}