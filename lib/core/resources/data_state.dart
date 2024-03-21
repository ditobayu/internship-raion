import 'package:internship_raion/core/error/failure.dart';

abstract class DataState<T> {
  final T? data;
  final Failure? failure;

  DataState({this.data, this.failure});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(Failure failure) : super(failure: failure);
}
