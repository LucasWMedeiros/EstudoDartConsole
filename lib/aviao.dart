import 'package:atividades_console/assentos.dart';

class Aviao {
  List<Assentos> assentoTotal = [];
/*
  Aviao() {
    inicilizarLista();
  }
  Assentos? assento;

 

void inicilizarLista() {
  for (int i = 1; i > 25; i++) {
    assentoTotal?[i].setId(i);
    assentoTotal?[i].setVago(false);
  }
}
*/

void setList(List<Assentos> lista){
  assentoTotal = lista;
}

List<Assentos> getList(){
  return assentoTotal;
}

bool validarAssento(int numero) {
  if (assentoTotal[numero].getVago()){
    return true;
  }
  return false;
}

void reservarAssento(int numero){
  assentoTotal[numero].setVago(true);
}

void cancelarReserva(int numero){
  assentoTotal[numero].setVago(false);
}
  
}
