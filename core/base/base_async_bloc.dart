import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/error/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseAsyncBloc<E, S> extends Bloc<E, AsyncValue<S>> {
  BaseAsyncBloc() : super(const AsyncValue.initial());

  Future<void> runguarded({
    required Emitter<AsyncValue<S>> emit,
    required Future<S> Function() future,
  }) async {
    try {
      emit(AsyncValue.data(data: await future()));
    } on NetworkException catch (err) {
      emit(AsyncValue.error(
        data: state.data,
        message: err.message,
        statusCode: err.statusCode,
      ));
    }
  }
}
