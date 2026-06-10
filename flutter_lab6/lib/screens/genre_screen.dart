import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  // State Variables
  String searchQuery = '';
  Set<String> selectedGenres = {};
  String selectedSort = 'A-Z';

  final TextEditingController _searchController = TextEditingController();
  final List<String> allGenres = ['Action', 'Drama', 'Comedy', 'Sci-Fi', 'Romance'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearFilters() {
    setState(() {
      selectedGenres.clear();
      searchQuery = '';
      _searchController.clear();
      selectedSort = 'A-Z';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Logic Lọc & Sắp xếp
    List<Movie> visibleMovies = allMovies.where((movie) {
      final matchSearch = movie.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchGenres = selectedGenres.isEmpty || movie.genres.any((g) => selectedGenres.contains(g));
      return matchSearch && matchGenres;
    }).toList();

    visibleMovies.sort((a, b) {
      switch (selectedSort) {
        case 'A-Z': return a.title.compareTo(b.title);
        case 'Z-A': return b.title.compareTo(a.title);
        case 'Year': return b.year.compareTo(a.year);
        case 'Rating': return b.rating.compareTo(a.rating);
        default: return 0;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find a Movie',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by title...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Genres',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      if (selectedGenres.isNotEmpty)
                        Badge(
                          label: Text('${selectedGenres.length}'),
                          child: const Icon(Icons.filter_list),
                        ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: _clearFilters,
                    icon: const Icon(Icons.clear, size: 18),
                    label: const Text('Clear Filters'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: allGenres.map((genre) {
                  return FilterChip(
                    label: Text(genre),
                    selected: selectedGenres.contains(genre),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  const Text('Sort by: ', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: selectedSort,
                    items: ['A-Z', 'Z-A', 'Year', 'Rating'].map((String sortType) {
                      return DropdownMenuItem<String>(
                        value: sortType,
                        child: Text(sortType),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSort = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Responsive List
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: visibleMovies[index]);
                        },
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: visibleMovies[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}