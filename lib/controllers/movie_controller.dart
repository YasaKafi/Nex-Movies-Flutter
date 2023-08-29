import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:movies_flutter_app/models/movie_detail.dart';

import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

class MovieController extends GetxController {
  var popularMovies = <Movie>[].obs;
  var topMovies = <Movie>[].obs;
  var upMovies = <Movie>[].obs;
  var detailMovies = <MovieDetail>[].obs;
  var isLoadingTopMovies = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getAllMovie();
  }


  Future<void> getTopRated() async {
    // Ubah menjadi Future<void>
    try {
      isLoadingTopMovies.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance
          .get(MovieRepository().getTopRatedMoviesApi, queryParameters: {
        'api_key': MovieRepository().apiKey,
        'language': 'en-US',
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> movieList = response.data["results"];
        topMovies.value =
            movieList.map((json) => Movie.fromJson(json)).toList();
      } else {
        print("Failed to fetch movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching movies: $error");
    } finally {
      isLoadingTopMovies.value = false;
    }
  }
  Future<void> getUpComing() async {
    // Ubah menjadi Future<void>
    try {
      isLoadingTopMovies.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance
          .get(MovieRepository().getUpComingApi, queryParameters: {
        'api_key': MovieRepository().apiKey,
        'language': 'en-US',
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> movieList = response.data["results"];
        upMovies.value = movieList.map((json) => Movie.fromJson(json)).toList();
      } else {
        print("Failed to fetch movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching movies: $error");
    } finally {
      isLoadingTopMovies.value = false;
    }
  }



  void getAllMovie() async {
    try {
      isLoadingTopMovies.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance.get(MovieRepository().getNowPlayingMoviesApi, queryParameters: {
        'api_key': MovieRepository().apiKey,
        'language': 'en-US',
        'page': 1,
      });

      if (response.statusCode == 200) {
        final List<dynamic> movieList = response.data["results"];
        popularMovies.value = movieList.map((json) => Movie.fromJson(json)).toList();
      } else {
        print("Failed to fetch movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching movies: $error");
    } finally{
      isLoadingTopMovies.value = false;
    }
  }


  Future<void> getDetailMovie(int id) async {
    // Ubah menjadi Future<void>
    try {
      
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance
          .get(MovieRepository().getMoviesUrl + "/$id", queryParameters: {
        'api_key': MovieRepository().apiKey,
        'language': 'en-US',
        'page': 1,
      });

      if (response.statusCode == 200) {
        if (response.data["results"] != null) {
          final List<dynamic> movieList = response.data["results"];
          detailMovies.value =
              movieList.map((json) => MovieDetail.fromJson(json)).toList();
        } else {
          print("No movie details found.");
        }
      } else {
        print("Failed to fetch movies. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error detail while fetching movies: $error");
    } 
  }
}
  
