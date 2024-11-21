import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_async_state.freezed.dart';

@freezed
class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.initial({T? data}) = _AsyncInitial<T>;
  const factory AsyncValue.loading({T? data}) = _AsyncLoading<T>;
  const factory AsyncValue.data({required T data}) = _AsyncData<T>;
  const factory AsyncValue.error({
    T? data,
    required String message,
    int? statusCode,
  }) = _AsyncError<T>;
}

extension AsyncValueX<T> on AsyncValue<T> {
  bool get isLoading => this is _AsyncLoading<T>;
  bool get hasError => this is _AsyncError<T>;
  String get errorMessage {
    if (hasError) {
      return (this as _AsyncError<T>).message;
    } else {
      return "";
    }
  }

  int? get getErrorStatus {
    if (hasError) {
      return (this as _AsyncError<T>).statusCode;
    } else {
      return -1;
    }
  }
}
