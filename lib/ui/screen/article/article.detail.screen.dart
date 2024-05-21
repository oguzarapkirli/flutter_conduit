import 'package:conduit/ui/component/app.screen.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const String routeName = '/article/:slug';
  final String? slug;
  const ArticleDetailScreen({super.key, this.slug});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(
        title: const Text('Article Detail'),
      ),
      child: Column(
        children: [
          const Text('Article Detail Screen'),
          Text('Slug: $slug'),
        ],
      ),
    );
  }
}
