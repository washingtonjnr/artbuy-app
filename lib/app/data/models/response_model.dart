class ResponseModel {
  final bool success;
  final dynamic payload;
  final dynamic error;

  ResponseModel({
    required this.success,
    required this.payload,
    this.error,
  });
}
