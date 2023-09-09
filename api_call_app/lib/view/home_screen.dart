import 'package:flutter/material.dart';  
import '../api/api.dart';
import '../models/movie.dart';
import '../widgets/movies_slider.dart';
import '../widgets/trending_slider.dart';
import '../widgets/upcome_movies_slider.dart';
class Homeview extends StatefulWidget{
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}



class _HomeviewState extends State<Homeview> {
  late Future<List<Movie>>upcomeMovies;
  late Future<List<Movie>>topRatedMovies;
  late Future<List<Movie>>trendingMovies;
@override
  void initState(){
  super.initState();
  trendingMovies=Api().getTrendingMovies();
  topRatedMovies=Api().getTopRatedMovies();
  upcomeMovies=Api().getUpcomeMovies();
}




  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('ForU',style: TextStyle(color: Colors.red,fontSize: 30)),
        ),
        body:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text('Trending Movies',style: TextStyle(fontSize: 25),),
                  const SizedBox(height: 16,),
                  SizedBox(
                    child: FutureBuilder(
                      future: trendingMovies,
                      builder: (context,snapshot)
                      {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else if (snapshot.hasData){
                          return  TrendingSlider(snapshot: snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }

                      }
                      ),

                  ),
                  const SizedBox(height: 16,),
                  const Text('Top Rated Movies',style: TextStyle(fontSize: 25),),
                  const SizedBox(height: 16,),
                  SizedBox(
                    child: FutureBuilder(
                      future: topRatedMovies,
                      builder: (context,snapshot)
                      {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else if (snapshot.hasData){
                          return  MoviesSlider(snap: snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                
                      })
                  ),
                  const SizedBox(height: 16,),
                  const Text('Upcoming Movies',style: TextStyle(fontSize: 25),),
                  const SizedBox(height: 16,),
                   SizedBox(
                    child: FutureBuilder(
                      future: upcomeMovies,
                      builder: ((context, snapshot) {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );

                        }
                        else if (snapshot.hasData){
                          return UpcomingMovieSlider(snapshotdata:snapshot);
                        }
                        else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      })),
                  )
                ],
              ),
          ),
        ),
        
      );
  }
}

