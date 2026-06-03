import 'package:flutter/material.dart';

import 'movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // State variable for the Optional Enhancement (Favorite Toggle)
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1 & 2. Blank Scaffold + AppBar / Hero Banner with Gradient
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Colors.black87,
                    )
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.movie.id,
                    child: Image.network(
                      widget.movie.posterUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient overlay
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 3. Title & Genres (Wrap + Chip)
                  Wrap(
                    spacing: 8.0,
                    children: widget.movie.genres.map((genre) {
                      return Chip(
                        label: Text(genre),
                        backgroundColor: Colors.grey[100],
                        side: BorderSide(color: Colors.grey.shade300),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // 4. Overview text with Padding
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  // 5. Row of IconButtons (Favorite, Rate, Share)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionItem(
                        icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey[700]!,
                        label: 'Favorite',
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      ),
                      _buildActionItem(
                        icon: Icons.star,
                        color: Colors.grey[700]!,
                        label: 'Rate',
                        onTap: () {},
                      ),
                      _buildActionItem(
                        icon: Icons.share,
                        color: Colors.grey[700]!,
                        label: 'Share',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Divider(height: 40),

                  // 6. Trailer list
                  const Text(
                    'Trailers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Using shrinkWrap inside a ScrollView
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.movie.trailers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.play_circle_fill, color: Colors.black87),
                        title: Text(widget.movie.trailers[index].title),
                        onTap: () {
                          // Trailer tap logic
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for action buttons
  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}