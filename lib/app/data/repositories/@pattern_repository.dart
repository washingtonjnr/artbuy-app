// ignore_for_file: file_names
import 'package:artbuy/app/data/models/response_model.dart';

abstract class PatternRepository {
  Future<ResponseModel> get();

  Future<ResponseModel> update<T>(T model);

  Future<bool> delete(String id);
}
