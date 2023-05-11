import 'package:imc_calc/imc_calc.dart' as imc_calc;
import 'dart:io';

class Person {
  String name;
  double? height;
  double? weight;

  Person(this.name, this.height, this.weight);

  double? calculate() {
    if (height != null && weight != null && height! > 0 && weight! > 0) {
      return weight! / (height! * height!);
    } else {
      return null;
    }
  }

  String? getIMCStatus() {
    double? imc = calculate();
    if (imc != null) {
      if (imc < 18.5) {
        return 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 25) {
        return 'Peso normal';
      } else if (imc >= 25 && imc < 30) {
        return 'Acima do peso';
      } else {
        return 'Obeso';
      }
    } else {
      return null;
    }
  }
}

void main() {
  print('Digite seu nome: ');
  String? name = stdin.readLineSync();

  print('Digite sua altura em metros: ');
  double? height = double.tryParse(stdin.readLineSync()!);

  print('Digite seu peso em kg: ');
  double? weight = double.tryParse(stdin.readLineSync()!);

  Person person = Person(name!, height, weight);

  String? imcStatus = person.getIMCStatus();
  if (imcStatus != null) {
    print('Seu IMC é: ${person.calculate()!.toStringAsFixed(2)}');
    print('Você está $imcStatus');
  } else {
    print('Valores inválidos!');
  }
}
