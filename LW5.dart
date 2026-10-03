import 'package:flutter/material.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const ProductPreviewScreen(),
    );
  }
}

class ProductPreviewScreen extends StatefulWidget {
  const ProductPreviewScreen({super.key});

  @override
  State<ProductPreviewScreen> createState() => _ProductPreviewScreenState();
}

class _ProductPreviewScreenState extends State<ProductPreviewScreen> {
  bool _isBookmarked = false;

  static const String _title =
      'Wireless Noise-Cancelling Headphones Pro Max Edition';
  static const double _price = 249.99;
  static const double _rating = 4.5;
  static const int _reviews = 1280;
  static const List<String> _categories = [
    'Electronics',
    'Audio',
    'Headphones',
    'Wireless',
    'Bestseller',
    'Free shipping',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Preview'), centerTitle: true),

      // Прокрутка: на маленьких экранах нет overflow
      body: SingleChildScrollView(
        child: Center(
          // На больших экранах контент не растягивается
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCover(), // 1. Stack
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleAndPrice(), // 2. Row
                      const SizedBox(height: 8),
                      _buildRating(), // 3. Row
                      const SizedBox(height: 16),
                      _buildCategories(), // 4. Wrap
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // 5. Липкая нижняя панель
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // 1. Stack: обложка + бейдж закладки
  Widget _buildCover() {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Фото товара из папки assets/images/
          Image.asset(
            'assets/images/headphones.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => Container(
              color: Colors.indigo.shade100,
              padding: const EdgeInsets.all(8),
              child: Center(child: Text('Ошибка: $error')),
            ),
          ),

          // Бейдж закладки
          Positioned(
            top: 12,
            right: 12,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 3,
              child: IconButton(
                onPressed: () => setState(() => _isBookmarked = !_isBookmarked),
                icon: Icon(
                  _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Row: название (Expanded) + цена
  Widget _buildTitleAndPrice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            _title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '\$${_price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }

  // 3. Row: звёзды рейтинга + текст
  Widget _buildRating() {
    return Row(
      children: [
        ...List.generate(5, (i) {
          IconData icon;
          if (_rating >= i + 1) {
            icon = Icons.star;
          } else if (_rating > i) {
            icon = Icons.star_half;
          } else {
            icon = Icons.star_border;
          }
          return Icon(icon, color: Colors.amber, size: 22);
        }),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '$_rating ($_reviews reviews)',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // 4. Wrap: бейджи категорий переносятся на новую строку
  Widget _buildCategories() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _categories
          .map(
            (c) => Chip(label: Text(c), visualDensity: VisualDensity.compact),
          )
          .toList(),
    );
  }

  // 5. Нижняя панель: кнопка на всю ширину через Expanded
  Widget _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
