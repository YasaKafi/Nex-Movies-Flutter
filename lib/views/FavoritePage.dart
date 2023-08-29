import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/helpers/themes.dart';
import '../controllers/movie_controller.dart';

class FavoritePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        future: movieController.getTopRated(), // Menggunakan future dari fungsi getAllMovie
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Menampilkan CircularProgressIndicator selama data sedang dimuat
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Menampilkan pesan error jika terjadi kesalahan
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            // Menampilkan data menggunakan ListView.builder
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: movieController.topMovies.length,
              itemBuilder: (context, index) {
                final movie = movieController.topMovies[index];
                final title = movie.title;
                final realeseDate = movie.releaseDate;
                final popularity = movie.popularity;
                final rating = movie.rating;
                final overview = movie.overview;
                final posterUrl =
                    "https://image.tmdb.org/t/p/original${movie.poster}";
                return CardMovie(
                  posterUrl: posterUrl,
                  title: title,
                  popularity: popularity,
                  overview: overview,
                  rating: rating,
                  realeseDate: realeseDate,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CardMovie extends StatelessWidget {
  final String posterUrl;
  final String title;
  final num popularity;
  final num rating;
  final String overview;
  final String realeseDate;

  const CardMovie({
    required this.posterUrl,
    required this.title,
    super.key,
    required this.popularity,
    required this.rating,
    required this.overview,
    required this.realeseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: backgroundColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      posterUrl,
                      width: 105,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 205,
                    height: 198,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                            child: Text(
                              title,
                              style: semiHeader,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                            child: Text(
                              'Release Date : ${realeseDate} ',
                              style: commonText,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: Text(
                              'Popularity : ${popularity}',
                              style: commonText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Rating : ',
                                  style: commonText,
                                ),
                              ),
                              RatingStars(rating: rating),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Overview : ',
                                  style: commonText,
                                ),
                              ),
                              Text(
                                overview,
                                style: descText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  final num rating;
  final int starCount;
  final double starSize;
  final Color color;

  RatingStars({
    required this.rating,
    this.starCount = 5,
    this.starSize = 20.0,
    this.color = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    double normalizedRating = (rating / 2).clamp(0, starCount).toDouble();
    int fullStars = normalizedRating.floor();
    double halfStar = normalizedRating - fullStars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index < fullStars) {
          return Icon(
            Icons.star,
            size: starSize,
            color: color,
          );
        } else if (index == fullStars && halfStar > 0) {
          return Icon(
            Icons.star_half,
            size: starSize,
            color: color,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: starSize,
            color: color,
          );
        }
      }),
    );
  }
}

