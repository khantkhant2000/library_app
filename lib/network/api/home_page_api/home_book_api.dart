import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../constant/api_constant.dart';
import '../../response/home_book_response/book_response.dart';

part 'home_book_api.g.dart';

@RestApi(baseUrl: kHomePageBaseUrl)
abstract class LibraryHomePageAPI {
  factory LibraryHomePageAPI(Dio dio) => _LibraryHomePageAPI(dio);
  @GET(kGetHomePageEndPoint)
  Future<BookResponse> getBookResponse(
      @Query(kHomePageQueryParams) String publishDate,
      @Query(kQueryParamAPIkey) String apiKey);
}
