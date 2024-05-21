import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/util/colors.dart';
import 'package:conduit/util/context_text_theme.extension.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends StatelessWidget {
  final ArticleDTO article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/article/${article.slug}');
      },
      child: Container(
        padding: UIConstants.defaultPadding,
        margin: const EdgeInsets.only(bottom: UIConstants.smallValue),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: UIConstants.mediumBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(article.author?.image ?? ''),
                ),
                const SizedBox(width: UIConstants.smallValue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.author?.username ?? ''),
                    Text(
                      DateFormat.yMMMd().format(
                        DateTime.parse(article.createdAt ?? ''),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(),
            Text(
              article.title ?? '',
              style: context.textTheme?.titleMedium,
            ),
            const SizedBox(height: UIConstants.smallValue),
            Text(
              article.description ?? '',
              style: context.textTheme?.bodyMedium,
            ),
            const SizedBox(height: UIConstants.smallValue),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: article.tagList?.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Chip(
                        label: Text(article.tagList![index]),
                      ),
                      const SizedBox(width: UIConstants.smallValue),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
