import 'package:bookly/Featchers/home/data/models/book_model/book_model.dart';
import 'package:bookly/Featchers/home/data/repos/home_repo.dart';
import 'package:bookly/core/utlis/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService apiService;

  HomeRepoImple(this.apiService);
  @override
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
     try {
  var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming');

List<BookModel> books=[];
for (var item in data['items']) {
  books.add(BookModel.fromJson(item));
}
return right(books);

} on Exception catch (e) {
  if(e is DioError){
  return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));

}
  }


  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
  var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

List<BookModel> books=[];
for (var item in data['items']) {
  try {
  books.add(BookModel.fromJson(item));
} catch (e) {
  books.add(BookModel.fromJson(item));
}
}
return right(books);

} on Exception catch (e) {
  if(e is DioError){
  return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));

}
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerBooks({required category}) async{
         try {
  var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');

List<BookModel> books=[];
for (var item in data['items']) {
  books.add(BookModel.fromJson(item));
}
return right(books);

} on Exception catch (e) {
  if(e is DioError){
  return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));

}
  }

}

