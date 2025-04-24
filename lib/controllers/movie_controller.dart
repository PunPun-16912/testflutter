import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/models/movies.dart';
import 'package:mytest/services/movie_service.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = false.obs;
  var searchText = ''.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading.value = true;
      movies.value = await MovieService.fetchMovies();
    } finally {
      isLoading.value = false;
    }
  }

  List<Movie> get filteredMovies => movies
      .where((movie) => movie.title.toLowerCase().contains(searchText.value.toLowerCase()))
      .toList();
}