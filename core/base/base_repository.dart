// import 'package:aquabuildr/core/error/network_exceptions.dart';
// import 'package:aquabuildr/core/services/database/database.dart';
// import 'package:aquabuildr/core/services/restapi/restapi.dart';
// import 'package:dio/dio.dart';

// class BaseRepository {
//   final RestApiService remoteDataSource;
//   final DatabaseService localDataSource;

//   BaseRepository(this.remoteDataSource, this.localDataSource);

//   Future<T> makeDioRequest<T>(Future<T> Function() dioRequest) async {
//     try {
//       return await dioRequest();
//     } on DioException catch (e) {
//       throw e.toNetworkException;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
