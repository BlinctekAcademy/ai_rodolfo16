import 'dart:convert';
import 'dart:io';

void main() {
  String? bytes;
  while (true) {
    stdout.write("-> ");
    bytes = stdin.readLineSync();
    var resultado = desencriptar(bytes: bytes);
    print("$resultado");
    if (resultado!.contains(RegExp(r'[0-9]+'))) {
      var conta = dividirOperacao(resultado);
      print(conta);
      print("${conta[0]}, ${conta[1]}");
    }
    print(encriptar(palavra: resultado));
  }
}

String? desencriptar({String? bytes}) {
  List<int> repartida = [];
  for (var i = 0; i < bytes!.length / 8; i++) {
    repartida.add(
      int.parse(
        bytes.substring(
          i * 8,
          (i + 1) * 8,
        ),
        radix: 2,
      ),
    );
  }
  print(repartida);
  return utf8.decode(repartida);
}

List<dynamic> dividirOperacao(String? lista) {
  List<int> numeros = [];
  List<String> operadores = [];
  String acc = '';
  for (var i = 0; i < lista!.length; i++) {
    if (lista[i] == '+' ||
        lista[i] == '-' ||
        lista[i] == '*' ||
        lista[i] == '/') {
      if (acc != '') {
        numeros.add(int.parse(acc));
      }
      acc = '';
      operadores.add(lista[i]);
    } else {
      acc += lista[i];
    }
  }
  numeros.add(int.parse(acc));
  return [numeros, operadores];
}

//TODO: fazer o executar operacao como uma arvore que analisa a prioridade dos operadores
int executarOperacao(List<int>? numeros, List<String>? operadores) {
  int resultado = numeros![0];
  int contador = 1;
  for (var operador in operadores!) {
    if (operador == '*') {
      resultado *= numeros[contador];
    } else if (operador == '/') {
      resultado ~/= numeros[contador];
    } else if (operador == '+') {
      resultado += numeros[contador];
    } else if (operador == '-') {
      resultado -= numeros[contador];
    }
    contador++;
  }
  return resultado;
}

String? encriptar({String? palavra}) {
  var texto = utf8.encode(palavra!);
  print(texto);
  var resultado = '';
  for (var i = 0; i < texto.length; i++) {
    resultado += texto[i].toRadixString(2).padLeft(8, '0');
  }
  return resultado;
}
