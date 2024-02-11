import 'package:stage_hls_assignment/core/error/custom_error.dart';

class Result<T> {
  Result({this.data, this.error});
  final T? data;
  final CustomError? error;
}
