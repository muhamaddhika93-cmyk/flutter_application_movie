import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppReel Movie',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF13091B), // Warna background ungu tua gelap
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF13091B),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'Popular',
    'New',
  ];

  final List<Map<String, String>> trendingMovies = [
    {
      'title': 'Whalefall (2026)',
      'subtitle': 'Based on your rate for \'Interstellar\'',
      'image': 'https://lumiere-a.akamaihd.net/v1/images/poster-whalefall-id-incinemas_84c2c344.jpeg',
    },
    {
      'title': 'The Odyssey',
      'subtitle': 'Based on novel by Irvine Welsh',
      'image': 'https://upload.wikimedia.org/wikipedia/id/a/a6/The_Odyssey-film_poster.jpg?utm_source=id.wikipedia.org&utm_campaign=imageinfo&utm_content=original',
    },
    {
      'title': 'Resident Evil',
      'subtitle': 'Based on novel by Irvine Welsh',
      'image': 'https://sin1.contabostorage.com/adef61e95f524badb0b95b15d2c793b7:portal/media/86282/resident-evil-2026-resmi-tayang-di-bioskop-indonesia-hadirkan-teror-survival-horror-20260916135525.jpg',
    },
  ];

  final List<Map<String, String>> popularMovies = [
    {
      'title': 'Spider-Man Brand New Day',
      'rating': '8.2',
      'tag': 'Hot',
      'image': 'https://upload.wikimedia.org/wikipedia/en/9/9a/Spider-Man_Brand_New_Day_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=thumbnail_unscaled',
    },
    {
      'title': 'READY OR NOT 2',
      'rating': '7.9',
      'tag': 'New',
      'image': 'https://dorangadgetcom.b-cdn.net/wp-content/uploads/2024/12/6.jpg',
    },
     {
      'title': 'GREENLAND 2: MIGRATION',
      'rating': '7.8',
      'tag': 'NEW',
      'image': 'https://dorangadgetcom.b-cdn.net/wp-content/uploads/2024/12/9.jpg',
    },
  ];

  final List<Map<String, String>> topRatedMovies = [
    {
      'title': 'HOPE',
      'rating': '7.8',
      'tag': 'New',
      'image': 'https://upload.wikimedia.org/wikipedia/id/8/83/Hope_2026_%28film_poster%29.jpg?utm_source=id.wikipedia.org&utm_campaign=imageinfo&utm_content=original',
    },
    {
      'title': 'HOPPER',
      'rating': '7.8',
      'tag': 'Top',
      'image': 'https://akcdn.detik.net.id/community/media/visual/2026/10/06/film-hoppers-foto-pixar-animation-1791348921966.jpeg?w=620&q=90%27',
    },
     {
      'title': 'MINOTOUR',
      'rating': '7.8',
      'tag': 'Top',
      'image': 'https://akcdn.detik.net.id/community/media/visual/2026/10/06/film-minotaur-foto-mk-productions-1791348924266.jpeg?w=620&q=90%27',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Icon Logo Play
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE91E63),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Teks AppReel
                    const Text(
                      'FilmTumpuk',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    // Tombol Search
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white70, size: 26),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFD81B60) // Warna Pink/Magenta Aktif
                              : const Color(0xFF231530), // Warna Chip Pasif
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white60,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              _buildSectionHeader('Trending Now'),
              const SizedBox(height: 12),

              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: trendingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = trendingMovies[index];
                    return Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(movie['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.9),
                            ],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie['title']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              movie['subtitle']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              _buildSectionHeader('Popular'),
              const SizedBox(height: 12),
              _buildMovieGridList(popularMovies),

              const SizedBox(height: 24),

              _buildSectionHeader('Top Rated'),
              const SizedBox(height: 12),
              _buildMovieGridList(topRatedMovies),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF190C24),
        selectedItemColor: const Color(0xFFE91E63),
        unselectedItemColor: Colors.white38,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Genre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieGridList(List<Map<String, String>> movieList) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Poster
                Stack(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(movie['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Badge Label (New / Hot)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E63),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          movie['tag']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Judul Film
                Text(
                  movie['title']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),             
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      movie['rating']!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}