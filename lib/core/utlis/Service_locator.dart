// ignore_for_file: file_names

import 'package:bookly/Featchers/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utlis/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// ignore: non_constant_identifier_names
void SetupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImple>(
    HomeRepoImple(getIt.get<ApiService>())
  );


}
