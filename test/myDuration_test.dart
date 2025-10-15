import 'package:my_first_project/EX-3.dart';
import 'package:test/test.dart';

void main() {
  test('fromHours creates correct milliseconds', () {
    MyDuration duration = MyDuration.fromHours(2);
    expect(duration.toString(), equals('2 hours, 0 minutes, 0 seconds'));
  });

  test('Additional of two duration', () {
    MyDuration d1 = MyDuration.fromHours(3);
    MyDuration d2 = MyDuration.fromMinutes(45);
    expect((d1 + d2).toString(), equals('3 hours, 45 minutes, 0 seconds'));
  });

  test('Substraction of two duration: d1 is bigger then d2', () {
    MyDuration d1 = MyDuration.fromHours(3);
    MyDuration d2 = MyDuration.fromMinutes(45);
    expect((d1 - d2).toString(), equals('2 hours, 15 minutes, 0 seconds'));
  });
  
  test('Substraction of two duration: d1 is smaller then d2', () {
    MyDuration d1 = MyDuration.fromMinutes(45);
    MyDuration d2 = MyDuration.fromHours(3);
    expect(() => d1 - d2, throwsA(isA<Exception>()));
  });

  test('Comparision: d1 is not greater than d2', () {
    MyDuration d1 = MyDuration.fromMinutes(45);
    MyDuration d2 = MyDuration.fromHours(3);
    expect(d1 > d2, false);
  });

  test('Comparision: d1 is greater than d2', () {
    MyDuration d1 = MyDuration.fromMinutes(45);
    MyDuration d2 = MyDuration.fromSeconds(3);
    expect(d1 > d2, true);
  });

  test('throws AssertionError when hours are negative', () {
      expect(() => MyDuration.fromHours(-5), throwsA(isA<AssertionError>()));
  });

  test('throws AssertionError when minutes are negative', () {
      expect(() => MyDuration.fromMinutes(-5), throwsA(isA<AssertionError>()));
  });

  test('throws AssertionError when seconds are negative', () {
      expect(() => MyDuration.fromSeconds(-5), throwsA(isA<AssertionError>()));
  });

}