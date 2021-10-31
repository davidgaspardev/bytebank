import 'package:bytebank/src/helpers/abstractions/model.dart';

/// Repository abstraction
abstract class Repository<T extends Model> {
  Future<int> create(T data);
  Future<List<T>> readAll();
}
