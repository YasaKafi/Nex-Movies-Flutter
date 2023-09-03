import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/auto_slider_controller.dart';
import '../controllers/movie_controller.dart';
import '../helpers/themes.dart';
import '../helpers/transparent_image.dart';

class HomePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());
  final ControllerPage controllerku = Get.put(ControllerPage());
  final List<String> imageAssets = [
    'assets/promo.jpeg',
    'assets/promo2.jpeg',
    'assets/promo3.jpeg',
    'assets/promo4.jpeg',
    'assets/promo5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF0C0C0C),
                ),
                child: FutureBuilder(
                  future: movieController.getUpComing(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Menampilkan CircularProgressIndicator saat data film belum dimuat
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 600),
                          viewportFraction: 1.0,
                          aspectRatio: 2 / 2.8,
                          enlargeCenterPage: true,
                        ),
                        items: movieController.upMovies
                            .map((movie) => Stack(
                                  children: [
                                    Stack(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.black87,
                                          highlightColor: Colors.white54,
                                          enabled: true,
                                          child: const AspectRatio(
                                              aspectRatio: 2 / 2.8,
                                              child: Icon(
                                                Icons.movie_outlined,
                                                color: Colors.black26,
                                                size: 40.0,
                                              )),
                                        ),
                                        AspectRatio(
                                            aspectRatio: 2 / 2.8,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: FadeInImage.memoryNetwork(
                                                fit: BoxFit.cover,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                image:
                                                    "https://image.tmdb.org/t/p/original/" +
                                                        movie.poster,
                                                placeholder: kTransparentImage,
                                              ),
                                            )),
                                      ],
                                    ),
                                    AspectRatio(
                                      aspectRatio: 2 / 2.8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              stops: const [
                                                0.0,
                                                0.4,
                                                0.4,
                                                1.0
                                              ],
                                              colors: [
                                                Colors.black.withOpacity(1.0),
                                                Colors.black.withOpacity(0.0),
                                                Colors.black.withOpacity(0.0),
                                                Colors.black.withOpacity(0.7),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5.0,
                                      right: 10.0,
                                      child: SafeArea(
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Release date: ",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            Text(
                                              movie.releaseDate,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30.0,
                                      left: 10.0,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/nex_movie_logo.svg',
                                            width: 20,
                                            height: 24,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('Nex Movie', style: homeHeader),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      );
                    }
                  },
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Text(
                      'Popular',
                      style: semiHeader,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    height: 180,

                    // Sesuaikan dengan tinggi item Anda
                    child: Obx(() {
                      if (movieController.isLoadingTopMovies.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Stack(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieController.popularMovies.length,
                              itemBuilder: (context, index) {
                                final movie =
                                    movieController.popularMovies[index];
                                final posterUrl =
                                    "https://image.tmdb.org/t/p/original${movie.poster}";
                                return GestureDetector(
                                  
                                  
                                  child: Container(
                                    width: 110,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        posterUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 10),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                    }),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Text(
                      'Information',
                      style: semiHeader,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125,
                        // Sesuaikan dengan tinggi item Anda
                        child: Stack(
                          children: [
                            PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: controllerku.pageController,
                              itemCount: imageAssets.length,
                              itemBuilder: (context, index) {
                                final assetPath = imageAssets[index];

                                // final movie = movieController.movies[index];
                                // final posterUrl = "https://image.tmdb.org/t/p/original${movie.poster}";
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  height: 125,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        8), // Adjust the radius as needed
                                    child: Image.asset(
                                      assetPath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom:
                                  12, // Sesuaikan dengan posisi yang Anda inginkan
                              left:
                                  0, // Sesuaikan dengan posisi yang Anda inginkan
                              right:
                                  0, // Sesuaikan dengan posisi yang Anda inginkan
                              child: Align(
                                child: SmoothPageIndicator(
                                  controller: controllerku.pageController,
                                  count: imageAssets.length,
                                  effect: ExpandingDotsEffect(
                                    activeDotColor: navBarActiveColor,
                                    dotColor: Colors.grey,
                                    dotHeight: 7,
                                    dotWidth: 7,
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: Text(
                      'Top Rated Movies',
                      style: semiHeader,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    height: 230,

                    // Sesuaikan dengan tinggi item Anda
                    child: Obx(() {
                      if (movieController.isLoadingTopMovies.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieController.topMovies.length,
                          itemBuilder: (context, index) {
                            final movie = movieController.topMovies[index];
                            final posterUrl =
                                "https://image.tmdb.org/t/p/original${movie.poster}";
                            return Container(
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  posterUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.only(right: 10),
                            );
                          },
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
