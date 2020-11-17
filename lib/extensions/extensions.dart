import 'package:intl/intl.dart';

extension NumberParsing on String {
  //새로운 메서드 정의
  int parseInt() {
    return int.parse(this);
  }
}

extension MyFancyList<T> on List<T> {
  //프로퍼티도 만들 수 있음
  //get은 쓰기 금지. 읽기만 가능.
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => <List<T>>[sublist(0, at), sublist(at)];
}

extension ToDate on String {
  String engDate() {
    DateTime date = DateTime.parse(this);
    String result = DateFormat.yMMMd().format(date);
    return result;
  }
}