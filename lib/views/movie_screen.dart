import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/views/detail.dart';
import '../controllers/movie_controller.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1B2D),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3, // ขนาดของ TextField
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (value) => controller.searchText.value = value,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search movie...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF252836),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(() {
                  return controller.searchText.value.isNotEmpty
                      ? TextButton(
                          onPressed: () {
                            controller.searchText.value = '';
                            controller.searchController.clear();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final movies = controller.filteredMovies;
                return ListView.builder(
                    padding: EdgeInsets.all(2),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => Detail(movie: movie));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F1B2D),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(movie.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text('Free',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_month_sharp,
                                            size: 16, color: Colors.white70),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie.year,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time,
                                            size: 16, color: Colors.white70),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie.duration,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }),
          ),
        ],
      ),
    );
  }
}
