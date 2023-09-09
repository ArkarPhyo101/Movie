import 'package:api_call_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

class UpcomingMovieSlider extends StatelessWidget {
  const UpcomingMovieSlider({
    super.key, required this.snapshotdata,
  });

  final AsyncSnapshot snapshotdata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200 ,width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshotdata.data.length,
        itemBuilder: (context ,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to((()=>DetailScreen(movie: snapshotdata.data[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshotdata.data[index].posterPath}'
            
                  ),
                ),
              ),
            ),
          );
        }),
    );
  }
}

