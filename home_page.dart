import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false;
  String searchText = '';
  int discount = 20; // BONUS: stored here so all cards share it

  void decreaseDiscount() {
    setState(() {
      if (discount > 0) discount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = movies.where((movie) {
      final text = searchText.toLowerCase();
      return movie.title.toLowerCase().contains(text) ||
          movie.genre.toLowerCase().contains(text);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No movies found'))
                : isGrid
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filtered[index],
                            discount: discount,
                            onDiscountTap: decreaseDiscount,
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filtered[index],
                            discount: discount,
                            onDiscountTap: decreaseDiscount,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
