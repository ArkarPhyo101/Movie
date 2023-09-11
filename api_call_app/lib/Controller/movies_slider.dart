import 'package:api_call_app/Controller/constants.dart';
import 'package:api_call_app/api/api.dart';
import 'package:flutter/material.dart';
import '../Model/movie.dart';
import 'package:get/get.dart';
import '../View/detail_screen.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  late Future<List<Movie>> topratedMovies;

  @override
  void initState() {
    super.initState();
    topratedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
          future: topratedMovies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to((() =>
                                DetailScreen(movie: snapshot.data![index])));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 200,
                              width: 150,
                              child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${Constants.imagePath}${snapshot.data![index].posterPath}'),
                            ),
                          ),
                        ),
                      );
                    }),
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
