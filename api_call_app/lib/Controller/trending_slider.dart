import 'package:api_call_app/api/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/movie.dart';
import '../View/detail_screen.dart';
import 'constants.dart';

class TrendindSlider extends StatefulWidget {
  const TrendindSlider({super.key});

  @override
  State<TrendindSlider> createState() => _TrendindSliderState();
}

class _TrendindSliderState extends State<TrendindSlider> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
          future: trendingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  options: CarouselOptions(
                      pageSnapping: true,
                      enlargeCenterPage: true,
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(seconds: 1)),
                  itemBuilder: (context, itemindex, pageViewIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to((() =>
                              DetailScreen(movie: snapshot.data![itemindex])));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 300,
                            width: 200,
                            child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                '${Constants.imagePath}${snapshot.data![itemindex].posterPath}'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
