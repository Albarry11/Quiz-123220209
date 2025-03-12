import 'package:flutter/material.dart';
import 'package:kuis_h/data/movie_data.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  final List<bool> addedToList = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome, User!")),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(movie.imgUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text("${movie.title} (${movie.year})"),
              subtitle: Text(movie.genre),
              trailing: IconButton(
                icon: Icon(
                  addedToList[index] ? Icons.check_box : Icons.check_box_outline_blank,
                  color: addedToList[index] ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    addedToList[index] = !addedToList[index];
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
