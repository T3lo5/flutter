import 'package:imc_calc/imc_calc.dart';
import 'package:test/test.dart';

import '../bin/imc_calc.dart';

void main() {
  group('Person', () {
    test('calculate() should return the correct value', () {
      Person person = Person('Test', 1.8, 80);
      expect(person.calculate(), equals(24.69));
    });

    test('getIMCStatus() should return the correct value', () {
      Person person1 = Person('Test', 1.8, 50);
      expect(person1.getIMCStatus(), equals('Abaixo do peso'));

      Person person2 = Person('Test', 1.8, 65);
      expect(person2.getIMCStatus(), equals('Peso normal'));

      Person person3 = Person('Test', 1.8, 85);
      expect(person3.getIMCStatus(), equals('Acima do peso'));

      Person person4 = Person('Test', 1.8, 110);
      expect(person4.getIMCStatus(), equals('Obeso'));
    });
  });
}