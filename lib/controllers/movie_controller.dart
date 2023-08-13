import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllMovie();
  }

  void getAllMovie() async {
    try {
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance.get(MovieRepository().getNowPlayingMoviesApi, queryParameters: {
        'api_key': MovieRepository().apiKey,
        'language': 'en-US',
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> movieList = response.data["results"];
        movies.value = movieList.map((json) => Movie.fromJson(json)).toList();
      } else {
        print("Failed to fetch movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching movies: $error");
    }
  }
}
