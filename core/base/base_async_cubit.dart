import 'dart:developer';

import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/error/network_exceptions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseAsyncCubit<T> extends Cubit<AsyncValue<T>> {
  BaseAsyncCubit() : super(const AsyncValue.initial());

  Future<void> runguarded(Future<T> Function() future) async {
    try {
      emit(AsyncValue.data(data: await future())); //success
    } on NetworkException catch (err) {
      if (isClosed) return;
      emit(
        AsyncValue.error(
          data: state.data,
          message: err.message,
          statusCode: err.statusCode,
        ),
      );
    } on FirebaseException catch (e) {
      log(e.message ?? "");
      if (isClosed) return;

      emit(
        AsyncValue.error(
          data: state.data,
          message: e.message ?? 'Unknown Firebase error',
          statusCode: 1,
        ),
      );
    } catch (e) {
      if (isClosed) return;

      log(e.toString());

      emit(
        AsyncValue.error(
          data: state.data,
          message: e.toString(),
          statusCode: 1,
        ),
      );
    }
  }
}
