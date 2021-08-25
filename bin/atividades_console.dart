import 'dart:io';

import 'package:atividades_console/assentos.dart';
import 'package:atividades_console/aviao.dart';
import 'package:atividades_console/caixa_eletronico.dart';
import 'package:atividades_console/prova.dart';

void main(List<String> arguments) {
  int atividadeEscolhida;
  bool validacao = true;

  while (validacao = true) {
    print('Insira qual atividade você deseja executar: ');
    print('1 - Caixa eletronico');
    print('2 - Avião');
    print('3 - Prova');
    print('4 - Sair');
    var resultado = stdin.readLineSync();
    if (resultado != null) {
      atividadeEscolhida = int.parse(resultado);

      if (atividadeEscolhida == 1) {
        CaixaEletronico caixa = CaixaEletronico();
        int operacao = 0;
        bool verificar = true;
        while (verificar == true) {
          print('Qual operação você deseja realizar?');
          print('1 - Verificar saldo do caxa');
          print('2 - Realizar deposito ao caixa');
          print('3 - Realizar saque');
          print('4 - sair');
          String? resultado = stdin.readLineSync();
          if (resultado != null) {
            operacao = int.parse(resultado);
            if (operacao == 1) {
              double saldo = caixa.extrato();
              print('o saldo atual do caixa é R\$' + saldo.toString());
              print('Deseja realizar outra operação?(s/n)');
              String? resposta = stdin.readLineSync();
              if (resposta == 's') {
                verificar = true;
              } else {
                verificar = false;
              }
            } else if (operacao == 2) {
              print('Insira o valor a ser depositado');
              String? resultado = stdin.readLineSync();
              if (resultado != null) {
                double valor = double.parse(resultado);
                bool validador = caixa.deposito(valor);
                if (validador == true) {
                  print('Deposito realizado com sucesso!');
                } else {
                  print('Um erro impossibilitou a realizaçãol do deposito!');
                }
                print('Deseja realizar outra operação?(s\n)');
                String? resposta = stdin.readLineSync();
                if (resposta == 's') {
                  verificar = true;
                } else {
                  verificar = false;
                }
              }
            } else if (operacao == 3) {
              print('Insira o valor a ser sacado: ');
              String? resultado = stdin.readLineSync();
              if (resultado != null) {
                double valor = double.parse(resultado);
                double saldo = caixa.extrato();
                if (valor > saldo) {
                  print('Valor desejado indisponivel para saque');
                } else {
                  bool validador = caixa.saque(valor);
                  if (validador == true) {
                    print('Saque realizado com sucesso!');
                  } else {
                    print('Algo impossibilitou o saque!');
                  }
                }
                print('Deseja realizar outra operação?(s\n)');
                String? resposta = stdin.readLineSync();
                if (resposta == 's') {
                  verificar = true;
                } else {
                  verificar = false;
                }
              }
            } else if (operacao == 4) {
              verificar == false;
              break;
            }
          }
        }
      } else if (atividadeEscolhida == 2) {
        Aviao aviao = Aviao();
        bool validacao = true;
        var atividadeEscolhida;
        List<Assentos> assentosTotal = [];
        late bool estaVago;

        void atualizarLista() {
          assentosTotal = aviao.getList();
        }

        while (validacao == true) {
          Assentos assento = new Assentos();
          assentosTotal.add(assento);
          for (int i = 1; i < 21; i++) {
            assento.setId(i);
            assento.setVago(false);
            assentosTotal.add(assento);
          }

          aviao.setList(assentosTotal);
          print('Qual operação você deseja realizar?');
          print('1 - Verificar se a assentos vagos');
          print('2 - Reservar assento');
          print('3 - Cancelar reserva');
          print('4 - Sair');
          var resultado = stdin.readLineSync();
          if (resultado != null) {
            atividadeEscolhida = int.parse(resultado);
          }
          if (atividadeEscolhida == 1) {
            print('Qual assento deseja verificar?');
            var result = stdin.readLineSync();
            if (result != null) {
              int assento = int.parse(result);
              estaVago = aviao.validarAssento(assento);
            }
            if (estaVago == false) {
              print('O assento está disponivel');
            } else {
              print('O assento não esta disponivel');
            }
            print('Deseja realizar outra operação?');
            String? resposta = stdin.readLineSync();
            if (resposta == 's') {
              validacao = true;
            } else {
              validacao = false;
            }
          } else if (atividadeEscolhida == 2) {
            late int assento;
            print('Qual assento deseja reservar?');
            var result = stdin.readLineSync();
            if (result != null) {
              assento = int.parse(result);
            }
            try {
              aviao.reservarAssento(assento);
              print('Assento reservado com sucesso!');
              atualizarLista();
            } catch (e) {
              print('Não foi possivel reservar o assento.');
            }
            print('Deseja realizar outra operação?');
            String? resposta = stdin.readLineSync();
            if (resposta == 's') {
              validacao = true;
            } else {
              validacao = false;
            }
          } else if (atividadeEscolhida == 3) {
            late int assento;
            print('Qual assento deseja cancelar a reserva?');
            var result = stdin.readLineSync();
            if (result != null) {
              assento = int.parse(result);
            }
            try {
              aviao.cancelarReserva(assento);
              print('Reserva cancelada com sucesso!');
              atualizarLista();
            } catch (e) {
              print('Não foi possivel cancelar a reserva.');
            }
            print('Deseja realizar outra operação?');
            String? resposta = stdin.readLineSync();
            if (resposta == 's') {
              validacao = true;
            } else {
              validacao = false;
            }
          } else if (atividadeEscolhida == 4) {
            validacao = false;
            break;
          }
        }
      } else if (atividadeEscolhida == 3) {
        Prova prova = Prova();
        print('Qual personagem da Marvel tem como identidade secreta Clint Barton?');
        print('a - Hulk');
        print('b - Homem de Ferro');
        print('c - Gavião Arqueiro');
        print('d - Capitão America');
        String? resposta = stdin.readLineSync();
        if(resposta != null){
        prova.Reponder(resposta);
        }
        bool correcao = prova.Corrigir();
        if(correcao == true){
          print('Parabéns, você acertou!');
        } else {
          print('A resposta está errada.');
          print('A resposta certa era:');
          print('c - Gavião Aqueiro');
          print(' ');
        }
      } else if (atividadeEscolhida == 4) {
        validacao = false;
        break;
      }
    }
  }
}
