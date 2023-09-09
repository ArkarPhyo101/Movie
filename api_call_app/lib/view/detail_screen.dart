import 'package:api_call_app/models/movie.dart';
import 'package:api_call_app/widgets/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/backbutton.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: [
          SliverAppBar.large(
              leading:  const Backbutton(),
              
                  backgroundColor: Colors.black,
                  expandedHeight: 500,
                  pinned: true,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(movie.title,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    background: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)
                      ),
                      child: Image.network('${Constants.imagePath}${movie.posterPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      ),
                    ),
                    
                  ),
                  
                  
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const Text('OverView',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800)),
                          const SizedBox(height: 16,),
                          Text(movie.overview,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                          const SizedBox(height: 16,),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      const Text('Release Date: ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      Text(movie.releaseDate,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold))

                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      const Text('Rating',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      const Icon(Icons.star,color: Colors.amber,size: 15,),
                                      Text('${movie.voteAverage.toStringAsFixed(1) }/10',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                      ),
                  )
        ],
      ),
    );
  }
}
