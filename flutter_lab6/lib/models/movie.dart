class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

// Mock Data
const List<Movie> allMovies = [
  Movie(title: 'Inception', year: 2010, genres: ['Action', 'Sci-Fi'], posterUrl: 'https://via.placeholder.com/150/0000FF/808080?Text=Inception', rating: 8.8),
  Movie(title: 'The Dark Knight', year: 2008, genres: ['Action', 'Drama'], posterUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?Text=Dark+Knight', rating: 9.0),
  Movie(title: 'Interstellar', year: 2014, genres: ['Sci-Fi', 'Drama'], posterUrl: 'https://via.placeholder.com/150/000000/FFFFFF?Text=Interstellar', rating: 8.6),
  Movie(title: 'The Hangover', year: 2009, genres: ['Comedy'], posterUrl: 'https://via.placeholder.com/150/FFFF00/000000?Text=Hangover', rating: 7.7),
  Movie(title: 'La La Land', year: 2016, genres: ['Comedy', 'Romance', 'Drama'], posterUrl: 'https://via.placeholder.com/150/FF69B4/FFFFFF?Text=La+La+Land', rating: 8.0),
  Movie(title: 'Mad Max: Fury Road', year: 2015, genres: ['Action', 'Sci-Fi'], posterUrl: 'https://via.placeholder.com/150/FFA500/000000?Text=Mad+Max', rating: 8.1),
];