import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../constant/api_constant.dart';
import '../../response/search_book_response/search_book_response.dart';
part 'search_api.g.dart';

@RestApi(baseUrl: kSearchBaseUrl)
abstract class LibraryAPI {
  factory LibraryAPI(Dio dio) => _LibraryAPI(dio);

  @GET(kGetSearchEndPoint)
  Future<SearchResponse> getSearchResponse(
      @Query(kSearchQueryParams) String key);
}
