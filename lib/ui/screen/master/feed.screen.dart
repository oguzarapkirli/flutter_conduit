import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/data/api/query/article.query.dart';
import 'package:conduit/data/provider/article.provider.dart';
import 'package:conduit/ui/component/app.screen.dart';
import 'package:conduit/ui/component/article.card.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  bool isLoading = false;
  late final TabController tabController;
  int selectedIndex = 0;

  static const _pageSize = 20;

  final PagingController<int, ArticleDTO> _globalPagingController =
      PagingController(firstPageKey: 0);

  final PagingController<int, ArticleDTO> _feedPagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchGlobal(int pageKey) async {
    try {
      final newItems =
          await Provider.of<ArticleProvider>(context, listen: false)
              .getArticles(
        query: ArticleQuery(limit: _pageSize, offset: pageKey),
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _globalPagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _globalPagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _globalPagingController.error = error;
    }
  }

  Future<void> _fetchFeed(int pageKey) async {
    try {
      final newItems =
          await Provider.of<ArticleProvider>(context, listen: false)
              .getFeedArticles(
        query: ArticleQuery(limit: _pageSize, offset: pageKey),
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _feedPagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _feedPagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _feedPagingController.error = error;
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _globalPagingController.addPageRequestListener((pageKey) {
      _fetchGlobal(pageKey);
    });
    _feedPagingController.addPageRequestListener((pageKey) {
      _fetchFeed(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      appBar: AppBar(
        title: const Text('Feed'),
        bottom: _buildTabBar(),
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          _buildGlobal(),
          _buildFeed(),
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: tabController,
      splashFactory: NoSplash.splashFactory,
      tabs: const [
        SizedBox(
          width: 100,
          height: 50,
          child: Tab(
            text: 'Global',
            icon: Icon(Icons.public),
            iconMargin: EdgeInsets.zero,
          ),
        ),
        SizedBox(
          width: 100,
          height: 50,
          child: Tab(
            text: 'Your Feed',
            icon: Icon(Icons.person),
            iconMargin: EdgeInsets.zero,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  Widget _buildFeed() {
    return Consumer<ArticleProvider>(
      builder: (context, articlePv, _) {
        if (articlePv.feedArticles.isEmpty) {
          return const Center(
            child: Text('No articles found'),
          );
        }
        return PagedListView<int, ArticleDTO>(
          pagingController: _feedPagingController,
          builderDelegate: PagedChildBuilderDelegate<ArticleDTO>(
            itemBuilder: (context, item, index) => ArticleCard(article: item),
          ),
        );
      },
    );
  }

  Widget _buildGlobal() {
    return Consumer<ArticleProvider>(
      builder: (context, articlePv, _) {
        if (articlePv.articles.isEmpty) {
          return const Center(
            child: Text('No articles found'),
          );
        }
        return PagedListView<int, ArticleDTO>(
          pagingController: _globalPagingController,
          builderDelegate: PagedChildBuilderDelegate<ArticleDTO>(
            itemBuilder: (context, item, index) => ArticleCard(article: item),
          ),
        );
      },
    );
  }
}
