class Prova{
  String? resp;

  void Reponder(String resposta){
    resp = resposta;
  }

  bool Corrigir(){
    if (resp == 'c'){
      return true;
    }
    return false;
  }
}