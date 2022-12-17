import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/Model/Movie.dart';

class movieList extends StatelessWidget {
  movieList({Key? key}) : super(key: key);
  final List<Movie> moviesList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.favorite),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.list),
          SizedBox(
            width: 5,
          )
        ],
        title: const Text("Movies"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MovieDetails(movie: moviesList[index])));
              },
              child: Card(
                  color: Colors.black,
                  child: MovieCard(index, moviesList[index].poster)),
            );
          }),
    );
  }

  Widget MovieCard(index, String imageurl) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black),
      height: 150,
      width: 200,
      child: Card(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(9.0),
              decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0)),
              child: Card(
                  child: Image.network(
                imageurl,
                fit: BoxFit.fill,
              )),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    moviesList[index].title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        moviesList[index].director,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 22,
                        width: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Colors.white, width: 1.0)),
                        child: Text(
                          moviesList[index].imdbRating,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(),
                child: Image.network(
                  movie.images[0],
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 262,
              )
            ]),
            Container(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 17.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                movie.genre,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(15.0))),
                  child: Text(
                    movie.runtime,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Text(
                    movie.released,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Text(
                    movie.country,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 220,
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 210,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100.withOpacity(0.1),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.plot,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.awards,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cast : ${movie.actors}",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                height: 175,
                child: MoviePoster(movie: movie)),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: const Text(
                      "Share",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MoviePoster extends StatelessWidget {
  final Movie movie;
  const MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movie.images.length,
        separatorBuilder: (BuildContext context, index) {
          return const SizedBox(width: 15.0);
        },
        itemBuilder: (BuildContext context, index) {
          return Container(
            width: 275,
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Image.network(
              movie.images[index],
              fit: BoxFit.fill,
            ),
          );
        });
  }
}
