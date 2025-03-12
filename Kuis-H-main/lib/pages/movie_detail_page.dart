import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.imgUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text("${movie.title} (${movie.year})", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Directed by ${movie.director}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text("Genre: ${movie.genre}", style: const TextStyle(fontSize: 16)),
            Text("Casts: ${movie.casts.join(', ')}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("⭐ Rated ${movie.rating}/10", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(movie.synopsis, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse(movie.movieUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text("Go to Wikipedia"),
            ),
          ],
        ),
      ),
    );
  }
}
