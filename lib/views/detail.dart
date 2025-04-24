import 'package:flutter/material.dart';
import 'package:mytest/models/movies.dart';
import 'package:mytest/views/movie_screen.dart'; // import model

class Detail extends StatelessWidget {
  final Movie movie;

  const Detail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1B2D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1B2D),
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(movie.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              movie.title,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.white70),
                const SizedBox(width: 6),
                Text(movie.year, style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white70),
                const SizedBox(width: 6),
                Text(movie.duration,
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person_sharp, color: Colors.white70),
                const SizedBox(width: 6),
                Text(movie.director,
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
