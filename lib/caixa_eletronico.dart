class CaixaEletronico {
  double _saldo = 5000;

  bool deposito(double? valor) {
    if (valor != null) {
      _saldo = _saldo + valor;
      return true;
    }
    return false;
  }

  double extrato() {
    return _saldo;
  }

  bool saque(double? valor) {
    if (valor != null) {
        _saldo = _saldo - valor;
        return true;
    }
    return false;
  }
}
