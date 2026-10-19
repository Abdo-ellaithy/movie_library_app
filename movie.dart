class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(title: 'Inception', genre: 'Sci-Fi', year: 2010, rating: 8.8, image: 'assets/posters/inception.jpg'),
  Movie(title: 'The Dark Knight', genre: 'Action', year: 2008, rating: 9.0, image: 'assets/posters/dark_knight.jpg'),
  Movie(title: 'Interstellar', genre: 'Sci-Fi', year: 2014, rating: 8.7, image: 'assets/posters/interstellar.jpg'),
  Movie(title: 'The Godfather', genre: 'Crime', year: 1972, rating: 9.2, image: 'assets/posters/godfather.jpg'),
  Movie(title: 'The Matrix', genre: 'Action', year: 1999, rating: 8.7, image: 'assets/posters/matrix.jpg'),
  Movie(title: 'Forrest Gump', genre: 'Drama', year: 1994, rating: 8.8, image: 'assets/posters/forrest_gump.jpg'),
  Movie(title: 'Gladiator', genre: 'Action', year: 2000, rating: 8.5, image: 'assets/posters/gladiator.jpg'),
  Movie(title: 'Spirited Away', genre: 'Animation', year: 2001, rating: 8.6, image: 'assets/posters/spirited_away.jpg'),
];
