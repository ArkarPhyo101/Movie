import 'package:api_call_app/Controller/trending_slider.dart';
import 'package:flutter/material.dart';  
import '../Controller/movies_slider.dart';
import '../Controller/upcome_movies_slider.dart';
import '../Model/movie.dart';
import '../api/api.dart';


class Homeview extends StatefulWidget{
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}



class _HomeviewState extends State<Homeview> {
  late Future<List<Movie>>upcomeMovies;
@override
  void initState(){
  super.initState();
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
                children:  const [
                  Text('Trending Movies',style: TextStyle(fontSize: 25),),
                  SizedBox(height: 16,),
                  TrendindSlider(),
                  SizedBox(height: 16,),
                  Text('Top Rated Movies',style: TextStyle(fontSize: 25),),
                  SizedBox(height: 16,),
                  MovieSlider(),
                  SizedBox(height: 16,),
                  Text('Upcoming Movies',style: TextStyle(fontSize: 25),),
                  SizedBox(height: 16,),
                  UpcomeMovie()
                ],  
              ),
          ),
        ),
        
      );
  }
}

