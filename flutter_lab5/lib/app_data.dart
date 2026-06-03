import 'package:flutter_lab5/trailer.dart';

import 'movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?q=80&w=800&auto=format&fit=crop', // Placeholder desert/sci-fi image
    overview: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(title: 'Official Trailer #1'),
      Trailer(title: 'IMAX Sneak Peek'),
    ],
  ),
  Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://images.unsplash.com/photo-1608889825103-eb5ed706fc64?q=80&w=800&auto=format&fit=crop', // Placeholder action image
    overview: 'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [
      Trailer(title: 'Red Band Trailer'),
      Trailer(title: 'Behind the Scenes'),
    ],
  ),
];