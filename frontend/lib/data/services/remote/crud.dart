import 'package:frontend/data/services/remote/http.dart';

final http = HTTP();

abstract class CRUD<T> {
  const CRUD({
    required this.path,
    required this.fromJson,
  });

  final String path;
  final T Function(dynamic json) fromJson;

  Future<List<T>> getAll() async {
    final res = await http.get(path);

    return (res.data as List).map(fromJson).toList();
  }

  Future<T?> getById(int id) async {
    final res = await http.get('$path/$id');

    return fromJson(res.data);
  }

  Future<T?> post(T payload) async {
    final res = await http.post(
      path,
      data: payload,
    );

    return fromJson(res.data);
  }

  Future<T?> patch(int id, T payload) async {
    final res = await http.patch(
      '$path/$id',
      data: payload,
    );

    return fromJson(res.data);
  }

  Future<T?> delete(int id) async {
    final res = await http.delete('$path/$id');

    return fromJson(res.data);
  }
}
