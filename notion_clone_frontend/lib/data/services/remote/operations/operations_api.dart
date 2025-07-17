import 'package:notion_clone_frontend/data/services/remote/http.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';

class OperationsApi {
  Future<bool> pushOperations(List<Operation> operations) async {
    final response = await HTTP().post(
      '/operations',
      data: operations.map((e) => e.toJson()).toList(),
    );

    final statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode >= 300) {
      return false;
    }

    return true;
  }
}
