import 'package:atividades_console/assentos.dart';

class Aviao {
  List<Assentos> assentoTotal = [];

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
