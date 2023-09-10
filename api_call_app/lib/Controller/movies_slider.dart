import 'package:api_call_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key, required this.snap,
  });
  final AsyncSnapshot snap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200 ,width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snap.data.length,
        itemBuilder: (context ,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              
              onTap: () {
                Get.to((()=>DetailScreen(movie: snap.data[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                      '${Constants.imagePath}${snap.data[index].posterPath}'
                  ),
                ),
              ),
            ),
          );
        }),
    );
  }
}

