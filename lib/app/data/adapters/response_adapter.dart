import 'package:artbuy/app/data/models/response_model.dart';

class ResponseAdapter {
  static Map<String, dynamic> toJson(ResponseModel model) {
    return {
      'success': model.success,
      'payload': model.payload,
    };
  }

  static ResponseModel fromJson(Map<String, dynamic> map) {
    return ResponseModel(
      success: map['success'],
      payload: map['payload'],
    );
  }
}
