import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:search_users_test/data/api/clients/api_client.dart';
import 'package:search_users_test/data/api/search.dart';
import 'package:search_users_test/data/api/user_detail.dart';
import 'package:search_users_test/domain/data/api/search.dart';
import 'package:search_users_test/domain/data/api/user_detail.dart';
import 'package:search_users_test/domain/usecases/search/search.dart';
import 'package:search_users_test/domain/usecases/search/user_detail.dart';
import 'package:search_users_test/pesentation/screens/detail/cubit.dart';
import 'package:search_users_test/pesentation/screens/search/cubit.dart';

final getIt = GetIt.instance;

Future<void> registerGetIt() async {
  ///Api
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<Dio>(() => getIt<ApiClient>().create());

  getIt.registerLazySingleton<SearchApi>(() => SearchApiImpl());
  getIt.registerLazySingleton<UserDetailApi>(() => UserDetailApiImpl());

  ///UseCases
  getIt.registerLazySingleton<SearchUseCase>(() => SearchUseCaseImpl());
  getIt.registerLazySingleton<UserDetailUseCase>(() => UserDetailUseCaseImpl());

  //Cubits
  getIt.registerFactory(() => SearchCubit());
  getIt.registerFactoryParam(
      (String urlDetail, _) => UserDetailCubit(urlDetail: urlDetail));
}
