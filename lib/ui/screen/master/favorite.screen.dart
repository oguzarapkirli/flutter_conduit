import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/data/api/query/article.query.dart';
import 'package:conduit/data/provider/article.provider.dart';
import 'package:conduit/ui/component/app.screen.dart';
import 'package:conduit/ui/component/article.card.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static const _pageSize = 20;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  static const _pageSize = 20;

  final PagingController<int, ArticleDTO> _favoritePagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchFavorite(int pageKey) async {
    try {
      final newItems =
          await Provider.of<ArticleProvider>(context, listen: false)
              .getFeedArticles(
        query: ArticleQuery(limit: _pageSize, offset: pageKey),
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _favoritePagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _favoritePagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _favoritePagingController.error = error;
    }
  }

  @override
  void initState() {
    _favoritePagingController.addPageRequestListener((pageKey) {
      _fetchFavorite(pageKey);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(title: const Text('Favorite')),
      child: _buildFeed(),
    );
  }

  Widget _buildFeed() {
    return PagedListView<int, ArticleDTO>(
      pagingController: _favoritePagingController,
      builderDelegate: PagedChildBuilderDelegate<ArticleDTO>(
        itemBuilder: (context, article, index) {
          return ArticleCard(article: article);
        },
        firstPageErrorIndicatorBuilder: (context) => Container(
          child: const Text('Error'),
        ),
        noItemsFoundIndicatorBuilder: (context) => Container(
          child: const Text('No items found'),
        ),
      ),
    );
  }
}
