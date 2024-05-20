// Adapter
import 'package:artbuy/app/data/adapters/user_adapter.dart';
import 'package:artbuy/app/data/models/response_model.dart';
// ignore: unused_import
import 'package:artbuy/app/data/models/user_model.dart';
// Service
import 'package:artbuy/app/data/services/api.dart';

class UserRepository {
  final _apiService = ApiService();

  Future<ResponseModel> get() async {
    final response = await _apiService.get("/user/me");

    return response;
  }

  Future<ResponseModel> update(UserModel model) async {
    final data = UserAdapter.toJson(model);

    final response = await _apiService.put("/user/me", data: data);

    return response;
  }

  Future<bool> delete(String id) async {
    try {
      await _apiService.delete("/user/me/$id");

      return true;
    } catch (e) {
      return false;
    }
  }
}
