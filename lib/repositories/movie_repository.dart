import 'package:dio/dio.dart';


class MovieRepository {
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getUpComingApi = '$mainUrl/movie/upcoming';
  var getPopularMoviesApi = '$mainUrl/movie/popular';
  var getTopRatedMoviesApi = '$mainUrl/movie/top_rated';
  var getNowPlayingMoviesApi = '$mainUrl/movie/now_playing';

  var getMoviesApi = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";
  var movieUrl = "$mainUrl/movie";


}